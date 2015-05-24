namespace :ubic do
  desc 'import document'
  task import_document: :environment do
    category_id = ENV['UBIC_CAT_ID']
    if category_id.blank?
      puts '[usage]bin/rake ubic:import_document UBIC_CAT_ID=[category_id]'
      exit
    end
    importer = Ubic::Importer.new category_id
    importer.import
  end
end
