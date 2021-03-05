class AddDefaultToImageColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_default :destinations, :image, "https://st-process-production.s3.amazonaws.com/e046bb6c-3dd0-4d92-be54-134802864556/fcf7bcb5-17a4-435f-88dd-3c2ae96a7585.jpg"x
  end
end
