class CreateKittens < ActiveRecord::Migration[7.1]
  def change
    create_table :kittens do |t|
      t.string :name
      t.string :string
      t.string :age
      t.string :integer
      t.string :cuteness
      t.string :softness

      t.timestamps
    end
  end
end
