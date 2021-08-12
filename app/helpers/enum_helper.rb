module EnumHelper
  # クラスオブジェクトとカラム名を引数として呼ばれるコールバック関数です
  def options_for_select_from_enum(klass,column, ja_klass = nil)
    #該当クラスのEnum型リストをハッシュで取得
    enum_list = klass.send(column.to_s.pluralize)
    #Enum型のハッシュリストに対して、nameと日本語化文字列の配列を取得（valueは使わないため_)
    enum_list.map do | name , _value |
      # selectで使うための組み合わせ順は[ 表示値, value値 ]のため以下の通り設定
      # a = "enums.#{ja_klass ? ja_klass.to_s.downcase : klass.to_s.downcase}.#{column}.#{name}"
      # byebug
      [ t("enums.#{ja_klass ? ja_klass.to_s.downcase : klass.to_s.downcase}.#{column}.#{name}") , name ]
    end
  end
end