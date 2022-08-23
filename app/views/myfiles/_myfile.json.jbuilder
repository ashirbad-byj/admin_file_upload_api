json.extract! myfile, :id, :filename, :status, :file_att, :created_at, :updated_at
json.url myfile_url(myfile, format: :json)
json.file_att url_for(myfile.file_att)
