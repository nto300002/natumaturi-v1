class UploadsController < ApplicationController
  def show
    model_name = params[:model].camelize.constantize
    mounted_as = params[:mounted_as].to_sym
    id = params[:id]
    filename = params[:filename]

    # モデルを取得
    model = model_name.find(id)

    # アップローダーを初期化
    uploader = model.send(mounted_as)

    # 画像の送信
    send_file uploader.path(filename), type: uploader.file.content_type, disposition: 'inline'
  end
end
