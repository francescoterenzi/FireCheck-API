module Response

    include ActiveModel::Serialization

    def json_response(object, status = :ok)
        render json: object, status: status
    end
end