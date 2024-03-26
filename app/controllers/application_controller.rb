class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #上記のkeysをnameのままにして、deviseの設定ファイルを初期設定からconfig.authentication_keys = [:name]に変更した結果、signin時emailの入力を受け付けなくなった。
    #上記の記述は、受け付けるカラムの許可をしているのであれば、初期設定デフォルトのまま、上記keysをnameのままでもname+パスワードでのログイン聞いたのでは？
  end

end
