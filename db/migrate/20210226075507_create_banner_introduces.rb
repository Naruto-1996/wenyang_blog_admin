class CreateBannerIntroduces < ActiveRecord::Migration[5.2]
  def change
    create_table :banner_introduces do |t|
      t.string :title
      t.string :little_title
      t.string :description

      t.timestamps
    end
  end
end
