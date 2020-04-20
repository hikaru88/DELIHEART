class TargetArea < ApplicationRecord
  belongs_to :surprise

  enum name:{
	  全国: 0,
    北海道: 1,
    東北: 2,
    関東: 3,
    中部: 4,
    近畿: 5,
    中国: 6,
    四国: 7,
    九州: 8,
    沖縄: 9
  }
end
