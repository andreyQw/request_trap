class CreateReqInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :req_infos do |t|
      t.string :remote_ip
      t.string :req_method
      t.string :scheme, default: ''
      t.string :query_string, default: ''
      t.string :query_params, default: ''
      t.string :cookies, default: ''
      t.string :headers, default: ''
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
