class PagesController < ApplicationController

  def home
    doc = File.open("./data/ENEDIS.xml") { |f| Nokogiri::XML(f) }

    @links = doc.xpath('//Index_C5/Corps_de_fichier_par_PDL').map do |i|
      {
        'Identifiant_Stable_PDL' => i.xpath('Identifiant_Stable_PDL/text()'),
        'Date_Debut_Consommation' => i.xpath('Situation_Contrat/Date_Debut_Consommation/text()'),
        'Date_Fin_Consommation' => i.xpath('Situation_Contrat/Date_Fin_Consommation/text()'),
        'Index_Debut_Consommation' => i.xpath('Situation_Contrat/Compteur/Periode/Donnees_Cadran/Index_Debut_Consommation/text()'),
        'Index_A_Facturer' => i.xpath('Situation_Contrat/Compteur/Periode/Donnees_Cadran/Index_A_Facturer/text()')
      }
    end
  end

end
