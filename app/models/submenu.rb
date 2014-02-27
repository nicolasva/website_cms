class Submenu < ActiveRecord::Base
  belongs_to :category
  has_many :annoncments
  has_many :contents
  has_one :contents_or_annoncment, as: :contents_or_annoncments, dependent: :destroy
  validates_presence_of :title
  has_one :homepage_submenu, as: :homepage_submenus, dependent: :destroy

  def self.content_or_annoncment(contents_or_annoncments)
    contents_or_annoncments.each do |key, value|
      #submenu = Submenu.find(key)
      #submenu.contents_or_annoncment.set_content_or_annoncment!(value)
      hash_contents_or_annoncment = Hash.new
      hash_contents_or_annoncment[:content_or_annoncment] = value
      hash_contents_or_annoncment[:contents_or_annoncments_id] = key
      hash_contents_or_annoncment[:contents_or_annoncments_type] = "Submenu"
      contents_or_annoncment = ContentsOrAnnoncment.new(hash_contents_or_annoncment) 
      contents_or_annoncment.save
    end
  end

  def self.homepage_submenu(homepage_submenus)
    HomepageSubmenu.update_all(:homepage => false)
    if HomepageSubmenu.exists?(:homepage_submenus_id => homepage_submenus.first)
      homepage_submenu = HomepageSubmenu.where(:homepage_submenus_id => homepage_submenus.first).first
      homepage_submenu.update(:homepage => true)
    else
      hash_homepage = Hash.new
      hash_homepage[:homepage] = true
      hash_homepage[:homepage_submenus_id] = homepage_submenus.first
      hash_homepage[:homepage_submenus_type] = "Submenu" 
      homepage_submenu = HomepageSubmenu.new(hash_homepage)
      homepage_submenu.save
    end
  end
end
