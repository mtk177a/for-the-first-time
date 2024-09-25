module ApplicationHelper
  def default_meta_tags
    {
      site: "For The First Time",
      title: "For The First Time",
      reverse: true,
      charset: "utf-8",
      description: "小さな「はじめて」を記録し、シェアすることで人生を豊かにするアプリ",
      keywords: "はじめて, 体験, 記録",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("ogp.png"), # 配置するパスやファイル名によって変更すること
        locale: "ja_JP"
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: "summary_large_image", # Twitterで表示する場合は大きいカードにする
        # site: '@For The First Time',', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        title: :title,
        description: :description,
        image: image_url("ogp.png") # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
