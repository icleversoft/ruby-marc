module MARC
require 'xslt'  
require 'nokogiri'
  # A class for mapping MARC records to Dublin Core
  
  class DublinCore

    def self.map(record)
      dc_hash = Hash.new
      dc_hash['title'] = get_field_value(record['245']['a'])

      # Creator
      [100, 110, 111, 700, 710, 711, 720].each do |field|
        dc_hash['creator'] ||= []
        dc_hash['creator'] << get_field_value(record[field.to_s])
      end

      # Subject
      [600, 610, 611, 630, 650, 653].each do |field|
        dc_hash['subject'] ||= []
        dc_hash['subject'] << get_field_value(record[field.to_s])
      end

      # Description
      [500..599].each do |field|
        next if [506, 530, 540, 546].include?(field)
        dc_hash['description'] ||= []
        dc_hash['description'] << get_field_value(record[field.to_s])
      end

      dc_hash['publisher'] = get_field_value(record['260']['a']['b']) rescue nil
      dc_hash['date'] = get_field_value(record['260']['c']) rescue nil
      dc_hash['type'] = get_field_value(record['655']) 
      dc_hash['format'] = get_field_value(record['856']['q']) rescue nil
      dc_hash['identifier'] = get_field_value(record['856']['u']) rescue nil
      dc_hash['source'] = get_field_value(record['786']['o']['t']) rescue nil
      dc_hash['language'] = get_field_value(record['546'])

      dc_hash['relation'] = []
      dc_hash['relation'] << get_field_value(record['530'])
      [760..787].each do |field|
        dc_hash['relation'] << get_field_value(record[field.to_s]['o']['t']) rescue nil
      end

      [651, 752].each do |field|
        dc_hash['coverage'] ||= []
        dc_hash['coverage'] << get_field_value(record[field.to_s])
      end

      [506, 540].each do |field|
        dc_hash['rights'] ||= []
        dc_hash['rights'] << get_field_value(record[field.to_s])
      end
      
      dc_hash.keys.each do |key| 
        dc_hash[key].flatten! if dc_hash[key].respond_to?(:flatten!)
        dc_hash[key].compact! if dc_hash[key].respond_to?(:compact!)
      end
      
      dc_hash
    end
      
    def self.unimarcmap(record)
      dc_hash = {'title' => [],
                 'creator' => [],
                 'subject' => [],
                 'publisher' => [],
                 'contributor' => [],
                 'date' => [],
                 'format' => [],
                 'language' => [],
                 'identifier' => [],
                 'source' => [],
                 'rights' => [],
                 'extern' => [],
                 'any' => [],
                 'type' => [],
                 'description' => []
              }
    
      xsl_file = File.dirname(__FILE__) + '/xsl/unimarc/unimarc2readable.xsl'
      record_xml = record.to_xml.to_s
      record_xml.gsub!(/\<record.[^\>]+/, '<record')
      
      record_xml.gsub!(/\eH/, '{')
      record_xml.gsub!(/\eI/, '}')
      xml_doc = XML::Document.string( record_xml )
      style_doc = XML::Document.file( xsl_file )
      stylesheet = LibXSLT::XSLT::Stylesheet.new( style_doc )

      #Apply StyleSheet
      out = stylesheet.apply( xml_doc )
      noko_doc = Nokogiri::XML( out.to_s )

      ident = noko_doc.search('identifier')
      date = noko_doc.search('date')
      type = noko_doc.search('type')
      level = noko_doc.search('level')
      lang = noko_doc.search('language')
      fields = noko_doc.search('field')

      dc_hash['identifier'] << ident.inner_text.strip
      dc_hash['date'] << date.inner_text.strip unless date.nil?
      dc_hash['type'] << "#{type.inner_text.strip} / #{level.inner_text.strip}"
      dc_hash['language'] << lang.inner_text.strip unless type.nil?

      fields.each do |field|
        field_code = field.attr('code').to_i

        case field_code
        when 200
          dc_hash['title'] << field.inner_text.strip
        when 210
          dc_hash['publisher'] << field.inner_text.strip
        when 215
          dc_hash['extern'] << field.inner_text.strip
        when 676
          dc_hash['subject'] << "#{field.inner_text.strip} (Dewey)"
        end  #end case
        #Creator/Publisher
        if [700,701,702,710,711,712,720,721,722,730].include?(field_code)
          sm = field.inner_text.strip.split('@')
          if sm.size == 2
            role = sm[1].to_i
            if role.to_i == 650
              dc_hash['publisher'] << sm[0].strip
            else
              dc_hash['creator'] << sm[0].strip
            end
          else
            dc_hash['creator'] << sm[0].strip
          end
        end
        #Subjects
        dc_hash['subject'] << field.inner_text.strip if (600..608).to_a.concat([610,615,620,661,670,680,686]).include?(field_code)
        #Description
        dc_hash['description'] << field.inner_text.strip if [327, 330].include?( field_code ) 
      end #fields.each...

      #Remove Duplicates
      dc_hash.keys.each do |key|
        dc_hash[key].uniq!
      end

      dc_hash
    end

    def self.get_field_value(field)
      return if field.nil?
      
      if !field.kind_of?(String) && field.respond_to?(:each)
        values = []
        field.each do |element|
          values << get_field_value(element)
        end
        values
      else
        return field if field.kind_of?(String)
        return field.value if field.respond_to?(:value)
      end
    end
    
  end
end

