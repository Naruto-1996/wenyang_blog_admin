class CreateAboutMes < ActiveRecord::Migration[5.2]
  def change
    create_table :about_mes do |t|
      t.string :birthday
      t.string :graduated_from
      t.string :website
      t.string :hobby
      t.string :address
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
