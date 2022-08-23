class MyfilesController < InheritedResources::Base


    def getFile
      file_ = Myfile.find_by(id: params[:id])

      if file_.present?
        p rails_blob_path(file_.file_att)
        render json: {id: file_[:id], filename: file_[:filename], status: file_[:status],
          file_url: url_for(file_.file_att),created_at: file_[:created_at], updated_at: file_[:updated_at]}, status: :ok
      else
        head :not_found
      end
    end

    
    def editFile

      f = Myfile.find(params[:id]);
      if (f.update(update_params));
        render json: {status: "ok"}
      else
        render json: {error: "error"}
      end

    end
    def addFile

      myfile = Myfile.new(create_params);

      if (myfile.save)
        render json: {status: "ok"}
      else
        render json: {error: "error"}
      end
    end
    def deleteFile
      f = Myfile.find(params[:id]);
      if (f.destroy)
        render json: {status: "ok"}
      else
        render json: {error: "error"}
      end
    end

    def create_params
      params.require().permit(:filename, :status, :file_att)
    end

    def update_params
      params.permit(:filename, :status, :file_att)
    end

end
