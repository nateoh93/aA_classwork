class AddConstraintsToCats < ActiveRecord::Migration[5.2]
  def change
      change_column_null :cats, :description, false
      change_column_null :cats, :color, false
      change_column_null :cats, :sex, false
  end
end
