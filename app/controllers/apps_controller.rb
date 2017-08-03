class AppsController < ApplicationController
  def index

  end

  def download_android_app
  send_file "#{Rails.root}/app/assets/docs/nitro_android_app.apk", type: "application/apk", x_sendfile: true
  end

  def download_kodi_addon
  send_file "#{Rails.root}/app/assets/docs/nitro_kodi_addon.zip", type: "application/zip", x_sendfile: true
  end

  def download_gse_iptv
  send_file "#{Rails.root}/app/assets/docs/gse-iptv.apk", type: "application/apk", x_sendfile: true
  end

  def download_stv_emulator
  send_file "#{Rails.root}/app/assets/docs/STVEmulatorPro.apk", type: "application/apk", x_sendfile: true
  end

end
