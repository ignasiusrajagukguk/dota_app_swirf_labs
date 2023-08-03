class HeroesModel {
  int? id;
  String? name;
  String? localizedName;
  String? primaryAttr;
  String? attackType;
  List<String>? roles;
  String? img;
  String? icon;
  num? baseHealth;
  num? baseHealthRegen;
  num? baseMana;
  num? baseManaRegen;
  num? baseArmor;
  num? baseMr;
  num? baseAttackMin;
  num? baseAttackMax;
  num? baseStr;
  num? baseAgi;
  num? baseInt;
  num? strGain;
  num? agiGain;
  num? intGain;
  num? attackRange;
  num? projectileSpeed;
  num? attackRate;
  num? baseAttackTime;
  num? attackPoint;
  num? moveSpeed;
  num? turnRate;
  bool? cmEnabled;
  num? legs;
  num? dayVision;
  num? nightVision;
  num? heroId;
  num? turboPicks;
  num? turboWins;
  num? proBan;
  num? proWin;
  num? proPick;
  num? i1Pick;
  num? i1Win;
  num? i2Pick;
  num? i2Win;
  num? i3Pick;
  num? i3Win;
  num? i4Pick;
  num? i4Win;
  num? i5Pick;
  num? i5Win;
  num? i6Pick;
  num? i6Win;
  num? i7Pick;
  num? i7Win;
  num? i8Pick;
  num? i8Win;
  num? nullPick;
  num? nullWin;
  HeroesModel(
      {this.id,
      this.name,
      this.localizedName,
      this.primaryAttr,
      this.attackType,
      this.roles,
      this.img,
      this.icon,
      this.baseHealth,
      this.baseHealthRegen,
      this.baseMana,
      this.baseManaRegen,
      this.baseArmor,
      this.baseMr,
      this.baseAttackMin,
      this.baseAttackMax,
      this.baseStr,
      this.baseAgi,
      this.baseInt,
      this.strGain,
      this.agiGain,
      this.intGain,
      this.attackRange,
      this.projectileSpeed,
      this.attackRate,
      this.baseAttackTime,
      this.attackPoint,
      this.moveSpeed,
      this.turnRate,
      this.cmEnabled,
      this.legs,
      this.dayVision,
      this.nightVision,
      this.heroId,
      this.turboPicks,
      this.turboWins,
      this.proBan,
      this.proWin,
      this.proPick,
      this.i1Pick,
      this.i1Win,
      this.i2Pick,
      this.i2Win,
      this.i3Pick,
      this.i3Win,
      this.i4Pick,
      this.i4Win,
      this.i5Pick,
      this.i5Win,
      this.i6Pick,
      this.i6Win,
      this.i7Pick,
      this.i7Win,
      this.i8Pick,
      this.i8Win,
      this.nullPick,
      this.nullWin});

  HeroesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = json['base_health'];
    baseHealthRegen = json['base_health_regen'];
    baseMana = json['base_mana'];
    baseManaRegen = json['base_mana_regen'];
    baseArmor = json['base_armor'];
    baseMr = json['base_mr'];
    baseAttackMin = json['base_attack_min'];
    baseAttackMax = json['base_attack_max'];
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = json['str_gain'];
    agiGain = json['agi_gain'];
    intGain = json['int_gain'];
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = json['attack_rate'];
    baseAttackTime = json['base_attack_time'];
    attackPoint = json['attack_point'];
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate'];
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
    dayVision = json['day_vision'];
    nightVision = json['night_vision'];
    heroId = json['hero_id'];
    turboPicks = json['turbo_picks'];
    turboWins = json['turbo_wins'];
    proBan = json['pro_ban'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
    i8Pick = json['8_pick'];
    i8Win = json['8_win'];
    nullPick = json['null_pick'];
    nullWin = json['null_win'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['localized_name'] = localizedName;
    map['primary_attr'] = primaryAttr;
    map['attack_type'] = attackType;
    map['roles'] = roles;
    map['img'] = img;
    map['icon'] = icon;
    map['base_health'] = baseHealth;
    map['base_health_regen'] = baseHealthRegen;
    map['base_mana'] = baseMana;
    map['base_mana_regen'] = baseManaRegen;
    map['base_armor'] = baseArmor;
    map['base_mr'] = baseMr;
    map['base_attack_min'] = baseAttackMin;
    map['base_attack_max'] = baseAttackMax;
    map['base_str'] = baseStr;
    map['base_agi'] = baseAgi;
    map['base_int'] = baseInt;
    map['str_gain'] = strGain;
    map['agi_gain'] = agiGain;
    map['int_gain'] = intGain;
    map['attack_range'] = attackRange;
    map['projectile_speed'] = projectileSpeed;
    map['attack_rate'] = attackRate;
    map['base_attack_time'] = baseAttackTime;
    map['attack_point'] = attackPoint;
    map['move_speed'] = moveSpeed;
    map['turn_rate'] = turnRate;
    map['cm_enabled'] = cmEnabled;
    map['legs'] = legs;
    map['day_vision'] = dayVision;
    map['night_vision'] = nightVision;
    map['hero_id'] = heroId;
    map['turbo_picks'] = turboPicks;
    map['turbo_wins'] = turboWins;
    map['pro_ban'] = proBan;
    map['pro_win'] = proWin;
    map['pro_pick'] = proPick;
    map['1_pick'] = i1Pick;
    map['1_win'] = i1Win;
    map['2_pick'] = i2Pick;
    map['2_win'] = i2Win;
    map['3_pick'] = i3Pick;
    map['3_win'] = i3Win;
    map['4_pick'] = i4Pick;
    map['4_win'] = i4Win;
    map['5_pick'] = i5Pick;
    map['5_win'] = i5Win;
    map['6_pick'] = i6Pick;
    map['6_win'] = i6Win;
    map['7_pick'] = i7Pick;
    map['7_win'] = i7Win;
    map['8_pick'] = i8Pick;
    map['8_win'] = i8Win;
    map['null_pick'] = nullPick;
    map['null_win'] = nullWin;
    return map;
  }
}
