crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :show_mypage do
  link "出品した用品-出品中", mypage_path
  parent :mypage
end

crumb :delete_mypage do
  link "ログアウト", delete_mypages_path
  parent :mypage
end

crumb :profile_mypage do
  link "プロフィール", profile_mypages_path
  parent :mypage
end

crumb :address_mypage do
  link "発送元・お届け先住所変更", address_mypages_path
  parent :mypage
end

crumb :card_mypage do
  link "支払い方法", card_mypages_path
  parent :mypage
end

crumb :password_mypage do
  link "メール/パスワード", password_mypages_path
  parent :mypage
end

crumb :identification_mypage do
  link "本人情報", identification_mypages_path
  parent :mypage
end

crumb :confirmation_mypage do
  link "電話番号の確認", confirmation_mypages_path
  parent :mypage
end