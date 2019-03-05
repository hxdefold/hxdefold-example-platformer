-- Generated by Haxe 4.0.0-rc.1+1fc84df26
local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
local Int = _hx_e();
local Dynamic = _hx_e();
local Float = _hx_e();
local Bool = _hx_e();
local Class = _hx_e();
local Enum = _hx_e();

local Array = _hx_e()
local Math = _hx_e()
local String = _hx_e()
local Std = _hx_e()
__defold_GoMessages = _hx_e()
__defold_PhysicsMessages = _hx_e()
__defold_RenderMessages = _hx_e()
__defold_SpriteMessages = _hx_e()
__defold_support_Script = _hx_e()
__platformer_Hero = _hx_e()
__platformer_Main = _hx_e()
__defold_support_Init = _hx_e()
__lua_Boot = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw
local _hx_pcall_default = {};
local _hx_pcall_break = {};

Array.new = function() 
  local self = _hx_new(Array.prototype)
  Array.super(self)
  return self
end
Array.super = function(self) 
  _hx_tab_array(self, 0);
end
Array.prototype = _hx_a();
Array.prototype.concat = function(self,a) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  local _g3 = 0;
  while (_g3 < a.length) do 
    local i1 = a[_g3];
    _g3 = _g3 + 1;
    _g:push(i1);
  end;
  do return _g end
end
Array.prototype.join = function(self,sep) 
  local tbl = ({});
  local _gthis = self;
  local cur_length = 0;
  local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end});
  while (i:hasNext()) do 
    _G.table.insert(tbl, Std.string(i:next()));
  end;
  do return _G.table.concat(tbl, sep) end
end
Array.prototype.pop = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[self.length - 1];
  self[self.length - 1] = nil;
  self.length = self.length - 1;
  do return ret end
end
Array.prototype.push = function(self,x) 
  self[self.length] = x;
  do return self.length end
end
Array.prototype.reverse = function(self) 
  local tmp;
  local i = 0;
  while (i < Std.int(self.length / 2)) do 
    tmp = self[i];
    self[i] = self[(self.length - i) - 1];
    self[(self.length - i) - 1] = tmp;
    i = i + 1;
  end;
end
Array.prototype.shift = function(self) 
  if (self.length == 0) then 
    do return nil end;
  end;
  local ret = self[0];
  if (self.length == 1) then 
    self[0] = nil;
  else
    if (self.length > 1) then 
      self[0] = self[1];
      _G.table.remove(self, 1);
    end;
  end;
  local tmp = self;
  tmp.length = tmp.length - 1;
  do return ret end
end
Array.prototype.slice = function(self,pos,_end) 
  if ((_end == nil) or (_end > self.length)) then 
    _end = self.length;
  else
    if (_end < 0) then 
      _end = _G.math.fmod((self.length - (_G.math.fmod(-_end, self.length))), self.length);
    end;
  end;
  if (pos < 0) then 
    pos = _G.math.fmod((self.length - (_G.math.fmod(-pos, self.length))), self.length);
  end;
  if ((pos > _end) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  end;
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = _end;
  while (_g < _g1) do 
    _g = _g + 1;
    ret:push(self[_g - 1]);
  end;
  do return ret end
end
Array.prototype.sort = function(self,f) 
  local i = 0;
  local l = self.length;
  while (i < l) do 
    local swap = false;
    local j = 0;
    local max = (l - i) - 1;
    while (j < max) do 
      if (f(self[j], self[j + 1]) > 0) then 
        local tmp = self[j + 1];
        self[j + 1] = self[j];
        self[j] = tmp;
        swap = true;
      end;
      j = j + 1;
    end;
    if (not swap) then 
      break;
    end;
    i = i + 1;
  end;
end
Array.prototype.splice = function(self,pos,len) 
  if ((len < 0) or (pos > self.length)) then 
    do return _hx_tab_array({}, 0) end;
  else
    if (pos < 0) then 
      pos = self.length - (_G.math.fmod(-pos, self.length));
    end;
  end;
  len = Math.min(len, self.length - pos);
  local ret = _hx_tab_array({}, 0);
  local _g = pos;
  local _g1 = pos + len;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    ret:push(self[i]);
    self[i] = self[i + len];
  end;
  local _g2 = pos + len;
  local _g3 = self.length;
  while (_g2 < _g3) do 
    _g2 = _g2 + 1;
    local i1 = _g2 - 1;
    self[i1] = self[i1 + len];
  end;
  local tmp = self;
  tmp.length = tmp.length - len;
  do return ret end
end
Array.prototype.toString = function(self) 
  local tbl = ({});
  _G.table.insert(tbl, "[");
  _G.table.insert(tbl, self:join(","));
  _G.table.insert(tbl, "]");
  do return _G.table.concat(tbl, "") end
end
Array.prototype.unshift = function(self,x) 
  local len = self.length;
  local _g = 0;
  while (_g < len) do 
    _g = _g + 1;
    local i = _g - 1;
    self[len - i] = self[(len - i) - 1];
  end;
  self[0] = x;
end
Array.prototype.insert = function(self,pos,x) 
  if (pos > self.length) then 
    pos = self.length;
  end;
  if (pos < 0) then 
    pos = self.length + pos;
    if (pos < 0) then 
      pos = 0;
    end;
  end;
  local cur_len = self.length;
  while (cur_len > pos) do 
    self[cur_len] = self[cur_len - 1];
    cur_len = cur_len - 1;
  end;
  self[pos] = x;
end
Array.prototype.remove = function(self,x) 
  local _g = 0;
  local _g1 = self.length;
  while (_g < _g1) do 
    _g = _g + 1;
    local i = _g - 1;
    if (self[i] == x) then 
      local _g2 = i;
      local _g11 = self.length - 1;
      while (_g2 < _g11) do 
        _g2 = _g2 + 1;
        local j = _g2 - 1;
        self[j] = self[j + 1];
      end;
      self[self.length - 1] = nil;
      self.length = self.length - 1;
      do return true end;
    end;
  end;
  do return false end
end
Array.prototype.indexOf = function(self,x,fromIndex) 
  local _end = self.length;
  if (fromIndex == nil) then 
    fromIndex = 0;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        fromIndex = 0;
      end;
    end;
  end;
  local _g = fromIndex;
  while (_g < _end) do 
    _g = _g + 1;
    local i = _g - 1;
    if (x == self[i]) then 
      do return i end;
    end;
  end;
  do return -1 end
end
Array.prototype.lastIndexOf = function(self,x,fromIndex) 
  if ((fromIndex == nil) or (fromIndex >= self.length)) then 
    fromIndex = self.length - 1;
  else
    if (fromIndex < 0) then 
      fromIndex = self.length + fromIndex;
      if (fromIndex < 0) then 
        do return -1 end;
      end;
    end;
  end;
  local i = fromIndex;
  while (i >= 0) do 
    if (self[i] == x) then 
      do return i end;
    else
      i = i - 1;
    end;
  end;
  do return -1 end
end
Array.prototype.copy = function(self) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(i);
  end;
  do return _g end
end
Array.prototype.map = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    _g:push(f(i));
  end;
  do return _g end
end
Array.prototype.filter = function(self,f) 
  local _g = _hx_tab_array({}, 0);
  local _g1 = 0;
  local _g2 = self;
  while (_g1 < _g2.length) do 
    local i = _g2[_g1];
    _g1 = _g1 + 1;
    if (f(i)) then 
      _g:push(i);
    end;
  end;
  do return _g end
end
Array.prototype.iterator = function(self) 
  local _gthis = self;
  local cur_length = 0;
  do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function(self) 
    do return cur_length < _gthis.length end;
  end,next=function(self) 
    cur_length = cur_length + 1;
    do return _gthis[cur_length - 1] end;
  end}) end
end
Array.prototype.resize = function(self,len) 
  if (self.length < len) then 
    self.length = len;
  else
    if (self.length > len) then 
      local _g = len;
      local _g1 = self.length;
      while (_g < _g1) do 
        _g = _g + 1;
        self[_g - 1] = nil;
      end;
      self.length = len;
    end;
  end;
end

Math.new = {}
Math.isNaN = function(f) 
  do return f ~= f end;
end
Math.isFinite = function(f) 
  if (f > -_G.math.huge) then 
    do return f < _G.math.huge end;
  else
    do return false end;
  end;
end
Math.max = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.max(a, b) end;
  end;
end
Math.min = function(a,b) 
  if (Math.isNaN(a) or Math.isNaN(b)) then 
    do return (0/0) end;
  else
    do return _G.math.min(a, b) end;
  end;
end

String.new = function(string) 
  local self = _hx_new(String.prototype)
  String.super(self,string)
  self = string
  return self
end
String.super = function(self,string) 
end
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((_G.type(o) == "string") and ((String.prototype[field] ~= nil) or (field == "length"))) then 
      _hx_1 = true; elseif (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        if (_G.type(String.__oldindex) == "function") then 
          do return String.__oldindex(s, k) end;
        else
          if (_G.type(String.__oldindex) == "table") then 
            do return String.__oldindex[k] end;
          end;
        end;
        do return nil end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_a();
String.prototype.toUpperCase = function(self) 
  do return _G.string.upper(self) end
end
String.prototype.toLowerCase = function(self) 
  do return _G.string.lower(self) end
end
String.prototype.indexOf = function(self,str,startIndex) 
  if (startIndex == nil) then 
    startIndex = 1;
  else
    startIndex = startIndex + 1;
  end;
  local r = _G.string.find(self, str, startIndex, true);
  if ((r ~= nil) and (r > 0)) then 
    do return r - 1 end;
  else
    do return -1 end;
  end;
end
String.prototype.lastIndexOf = function(self,str,startIndex) 
  local ret = -1;
  if (startIndex == nil) then 
    startIndex = #self;
  end;
  while (true) do 
    local startIndex1 = ret + 1;
    if (startIndex1 == nil) then 
      startIndex1 = 1;
    else
      startIndex1 = startIndex1 + 1;
    end;
    local r = _G.string.find(self, str, startIndex1, true);
    local p = (function() 
      local _hx_1
      if ((r ~= nil) and (r > 0)) then 
      _hx_1 = r - 1; else 
      _hx_1 = -1; end
      return _hx_1
    end )();
    if ((p == -1) or (p > startIndex)) then 
      break;
    end;
    ret = p;
  end;
  do return ret end
end
String.prototype.split = function(self,delimiter) 
  local idx = 1;
  local ret = _hx_tab_array({}, 0);
  while (idx ~= nil) do 
    local newidx = 0;
    if (#delimiter > 0) then 
      newidx = _G.string.find(self, delimiter, idx, true);
    else
      if (idx >= #self) then 
        newidx = nil;
      else
        newidx = idx + 1;
      end;
    end;
    if (newidx ~= nil) then 
      ret:push(_G.string.sub(self, idx, newidx - 1));
      idx = newidx + #delimiter;
    else
      ret:push(_G.string.sub(self, idx, #self));
      idx = nil;
    end;
  end;
  do return ret end
end
String.prototype.toString = function(self) 
  do return self end
end
String.prototype.substring = function(self,startIndex,endIndex) 
  if (endIndex == nil) then 
    endIndex = #self;
  end;
  if (endIndex < 0) then 
    endIndex = 0;
  end;
  if (startIndex < 0) then 
    startIndex = 0;
  end;
  if (endIndex < startIndex) then 
    do return _G.string.sub(self, endIndex + 1, startIndex) end;
  else
    do return _G.string.sub(self, startIndex + 1, endIndex) end;
  end;
end
String.prototype.charAt = function(self,index) 
  do return _G.string.sub(self, index + 1, index + 1) end
end
String.prototype.charCodeAt = function(self,index) 
  do return _G.string.byte(self, index + 1) end
end
String.prototype.substr = function(self,pos,len) 
  if ((len == nil) or (len > (pos + #self))) then 
    len = #self;
  else
    if (len < 0) then 
      len = #self + len;
    end;
  end;
  if (pos < 0) then 
    pos = #self + pos;
  end;
  if (pos < 0) then 
    pos = 0;
  end;
  do return _G.string.sub(self, pos + 1, pos + len) end
end

Std.new = {}
Std.string = function(s) 
  do return __lua_Boot.__string_rec(s) end;
end
Std.int = function(x) 
  if (not Math.isFinite(x) or Math.isNaN(x)) then 
    do return 0 end;
  else
    do return _hx_bit_clamp(x) end;
  end;
end

__defold_GoMessages.new = {}

__defold_PhysicsMessages.new = {}

__defold_RenderMessages.new = {}

__defold_SpriteMessages.new = {}

__defold_support_Script.new = function() 
  local self = _hx_new()
  __defold_support_Script.super(self)
  return self
end
__defold_support_Script.super = function(self) 
end

__platformer_Hero.new = function() 
  local self = _hx_new(__platformer_Hero.prototype)
  __platformer_Hero.super(self)
  return self
end
__platformer_Hero.super = function(self) 
  __defold_support_Script.super(self);
end
__platformer_Hero.prototype = _hx_a();
__platformer_Hero.prototype.init = function(self,_self) 
  _G.msg.post(".", __defold_GoMessages.acquire_input_focus);
  _self.velocity = _G.vmath.vector3(0, 0, 0);
  _self.correction = _G.vmath.vector3();
  _self.ground_contact = false;
  _self.move_input = 0;
  _self.direction = 1;
  _self.anim = nil;
  _self.touch_jump_timer = 0;
end
__platformer_Hero.prototype.update = function(self,_self,dt) 
  local speed_diff = (_self.move_input * __platformer_Hero.max_speed) - _self.velocity.x;
  local acceleration = _G.vmath.vector3(0, __platformer_Hero.gravity, 0);
  if (speed_diff ~= 0) then 
    if (speed_diff < 0) then 
      acceleration.x = -__platformer_Hero.move_acceleration;
    else
      acceleration.x = _hx_funcToField(__platformer_Hero.move_acceleration);
    end;
    if (not _self.ground_contact) then 
      acceleration.x = __platformer_Hero.air_acceleration_factor * acceleration.x;
    end;
  end;
  local dv = (acceleration) * (dt);
  if (_G.math.abs(dv.x) > _G.math.abs(speed_diff)) then 
    dv.x = speed_diff;
  end;
  local v0 = _self.velocity;
  local a = _self.velocity;
  _self.velocity = (a) + (dv);
  local b = _self.velocity;
  local a1 = (v0) + (b);
  local a2 = (a1) * (dt);
  local dp = (a2) * (0.5);
  local a3 = _G.go.get_position();
  _G.go.set_position((a3) + (dp));
  if (_self.touch_jump_timer > 0) then 
    _self.touch_jump_timer = _self.touch_jump_timer - dt;
  end;
  self:update_animations(_self);
  _self.correction = _G.vmath.vector3();
  _self.move_input = 0;
  _self.ground_contact = false;
end
__platformer_Hero.prototype.update_animations = function(self,_self) 
  _G.sprite.set_hflip("#sprite", _self.direction < 0);
  if (_self.ground_contact) then 
    if (_self.velocity.x == 0) then 
      self:play_animation(_self, __platformer_Hero.anim_idle);
    else
      self:play_animation(_self, __platformer_Hero.anim_run);
    end;
  else
    if (_self.velocity.y > 0) then 
      self:play_animation(_self, __platformer_Hero.anim_jump);
    else
      self:play_animation(_self, __platformer_Hero.anim_fall);
    end;
  end;
end
__platformer_Hero.prototype.play_animation = function(self,_self,anim) 
  if (_self.anim ~= anim) then 
    _G.msg.post("#sprite", __defold_SpriteMessages.play_animation, _hx_o({__fields__={id=true},id=anim}));
    _self.anim = anim;
  end;
end
__platformer_Hero.prototype.handle_geometry_contact = function(self,_self,normal,distance) 
  local proj = _G.vmath.dot(_self.correction, normal);
  local comp = (normal) * (distance - proj);
  local a = _self.correction;
  _self.correction = (a) + (comp);
  local a1 = _G.go.get_position();
  _G.go.set_position((a1) + (comp));
  if (normal.y > 0.7) then 
    _self.ground_contact = true;
  end;
  proj = _G.vmath.dot(_self.velocity, normal);
  if (proj < 0) then 
    local a2 = _self.velocity;
    local b = (normal) * (proj);
    _self.velocity = (a2) - (b);
  end;
end
__platformer_Hero.prototype.on_message = function(self,_self,message_id,message,_) 
  if (message_id == __defold_PhysicsMessages.contact_point_response) then 
    if (message.other_group == __platformer_Hero.group_geometry) then 
      self:handle_geometry_contact(_self, message.normal, message.distance);
    end;
  end;
end
__platformer_Hero.prototype.jump = function(self,_self) 
  if (_self.ground_contact) then 
    _self.velocity.y = _hx_funcToField(__platformer_Hero.jump_takeoff_speed);
    self:play_animation(_self, __platformer_Hero.anim_jump);
  end;
end
__platformer_Hero.prototype.abort_jump = function(self,_self) 
  if (_self.velocity.y > 0) then 
    _self.velocity.y = _self.velocity.y * 0.5;
  end;
end
__platformer_Hero.prototype.on_input = function(self,_self,action_id,action) 
  if (action_id) == __platformer_Hero.input_jump then 
    if (action.pressed) then 
      self:jump(_self);
    else
      if (action.released) then 
        self:abort_jump(_self);
      end;
    end;
  elseif (action_id) == __platformer_Hero.input_left then 
    _self.move_input = -action.value;
    _self.direction = -1;
  elseif (action_id) == __platformer_Hero.input_right then 
    _self.move_input = _hx_funcToField(action.value);
    _self.direction = 1;
  elseif (action_id) == __platformer_Hero.input_touch then 
    local diff = action.x - _G.go.get_position().x;
    if (diff > 0) then 
      _self.direction = 1;
    else
      _self.direction = -1;
    end;
    if (_G.math.abs(diff) > 10) then 
      _self.move_input = diff / 100;
      _self.move_input = Math.min(1, Math.max(-1, _self.move_input));
    end;
    if (action.released) then 
      _self.touch_jump_timer = _hx_funcToField(__platformer_Hero.touch_jump_timeout);
    else
      if (action.pressed) then 
        if (_self.touch_jump_timer > 0) then 
          self:jump(_self);
        end;
      end;
    end; end;
  do return false end
end
__platformer_Hero.__super__ = __defold_support_Script
setmetatable(__platformer_Hero.prototype,{__index=__defold_support_Script.prototype})

__platformer_Main.new = function() 
  local self = _hx_new(__platformer_Main.prototype)
  __platformer_Main.super(self)
  return self
end
__platformer_Main.super = function(self) 
  __defold_support_Script.super(self);
end
__platformer_Main.prototype = _hx_a();
__platformer_Main.prototype.init = function(self,_) 
  _G.msg.post("@render:", __defold_RenderMessages.clear_color, _hx_o({__fields__={color=true},color=_G.vmath.vector4(0.37647058823529411, 0.58039215686274515, 0.72549019607843135, 0)}));
end
__platformer_Main.__super__ = __defold_support_Script
setmetatable(__platformer_Main.prototype,{__index=__defold_support_Script.prototype})

__defold_support_Init.new = {}
__defold_support_Init.init = function(exports) 
  local script = __platformer_Hero.new();
  exports.platformer_Hero_init = function(_self) 
    script:init(_self);
  end;
  exports.platformer_Hero_update = function(self1,dt) 
    script:update(self1, dt);
  end;
  exports.platformer_Hero_on_message = function(self2,message_id,message,_) 
    script:on_message(self2, message_id, message, _);
  end;
  exports.platformer_Hero_on_input = function(self3,action_id,action) 
    do return script:on_input(self3, action_id, action) end;
  end;
  local script1 = __platformer_Main.new();
  exports.platformer_Main_init = function(_1) 
    script1:init(_1);
  end;
end

__lua_Boot.new = {}
__lua_Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
__lua_Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(Std.string(o[0])) .. Std.string("(");
    s = Std.string(s) .. Std.string("\t");
    local _g = 2;
    local _g1 = o.length;
    while (_g < _g1) do 
      _g = _g + 1;
      local i = _g - 1;
      if (i ~= 2) then 
        str = Std.string(str) .. Std.string((Std.string(",") .. Std.string(__lua_Boot.__string_rec(o[i], s))));
      else
        str = Std.string(str) .. Std.string(__lua_Boot.__string_rec(o[i], s));
      end;
    end;
    do return Std.string(str) .. Std.string(")") end;
  end;
end
__lua_Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = __lua_Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
__lua_Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  local _g = type(o);
  if (_g) == "boolean" then 
    do return tostring(o) end;
  elseif (_g) == "function" then 
    do return "<function>" end;
  elseif (_g) == "nil" then 
    do return "null" end;
  elseif (_g) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o == 0) then 
          do return "0" end;
        else
          if (o ~= o) then 
            do return "NaN" end;
          else
            do return tostring(o) end;
          end;
        end;
      end;
    end;
  elseif (_g) == "string" then 
    do return o end;
  elseif (_g) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return __lua_Boot.printEnum(o, s) end;
    else
      if ((_hx_wrap_if_string_field(o,'toString') ~= nil) and not __lua_Boot.isArray(o)) then 
        do return _hx_wrap_if_string_field(o,'toString')(o) end;
      else
        if (__lua_Boot.isArray(o)) then 
          local o2 = o;
          if (#s > 5) then 
            do return "[...]" end;
          else
            local _g1 = _hx_tab_array({}, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g1:push(__lua_Boot.__string_rec(i, Std.string(s) .. Std.string(1)));
            end;
            do return Std.string(Std.string("[") .. Std.string(_g1:join(","))) .. Std.string("]") end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return Std.string(Std.string("{") .. Std.string(__lua_Boot.printClassRec(o, "", Std.string(s) .. Std.string("\t")))) .. Std.string("}") end;
          else
            local fields = __lua_Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer, "{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer, ", ");
              end;
              _G.table.insert(buffer, Std.string(Std.string(Std.string("") .. Std.string(Std.string(f1))) .. Std.string(" : ")) .. Std.string(Std.string(o[f1])));
            end;
            _G.table.insert(buffer, " }");
            do return _G.table.concat(buffer, "") end;
          end;
        end;
      end;
    end;
  elseif (_g) == "thread" then 
    do return "<thread>" end;
  elseif (_g) == "userdata" then 
    local mt = _G.getmetatable(o);
    if ((mt ~= nil) and (mt.__tostring ~= nil)) then 
      do return _G.tostring(o) end;
    else
      do return "<userdata>" end;
    end;else
  _G.error("Unknown Lua type",0); end;
end
__lua_Boot.fieldIterator = function(o) 
  if (_G.type(o) ~= "table") then 
    do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
      do return nil end;
    end,hasNext=function(self) 
      do return false end;
    end}) end;
  end;
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (__lua_Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1, val);
    end;
    do return val end;
  end;
  local cur_val = next_valid(tbl, cur(tbl, nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function(self) 
    local ret = cur_val;
    cur_val = next_valid(tbl, cur(tbl, cur_val));
    do return ret end;
  end,hasNext=function(self) 
    do return cur_val ~= nil end;
  end}) end;
end
_hx_bit_clamp = function(v) 
  if v <= 2147483647 and v >= -2147483648 then
    if v > 0 then return _G.math.floor(v)
    else return _G.math.ceil(v)
    end
  end
  if v > 2251798999999999 then v = v*2 end;
  if (v ~= v or math.abs(v) == _G.math.huge) then return nil end
  return _hx_bit.band(v, 2147483647 ) - math.abs(_hx_bit.band(v, 2147483648))
end
pcall(require, 'bit')
if bit then
  _hx_bit = bit
else
  local _hx_bit_raw = _G.require('bit32')
  _hx_bit = setmetatable({}, { __index = _hx_bit_raw });
  _hx_bit.bnot = function(...) return _hx_bit_clamp(_hx_bit_raw.bnot(...)) end;
  _hx_bit.bxor = function(...) return _hx_bit_clamp(_hx_bit_raw.bxor(...)) end;
end
_hx_array_mt.__index = Array.prototype

local _hx_static_init = function()
  __defold_GoMessages.acquire_input_focus = _G.hash("acquire_input_focus");
  __defold_PhysicsMessages.contact_point_response = _G.hash("contact_point_response");
  __defold_RenderMessages.clear_color = _G.hash("clear_color");
  __defold_SpriteMessages.play_animation = _G.hash("play_animation");
  __platformer_Hero.move_acceleration = 3500;
  __platformer_Hero.air_acceleration_factor = 0.8;
  __platformer_Hero.max_speed = 400;
  __platformer_Hero.gravity = -1100;
  __platformer_Hero.jump_takeoff_speed = 700;
  __platformer_Hero.touch_jump_timeout = 0.2;
  __platformer_Hero.anim_run = _G.hash("run");
  __platformer_Hero.anim_idle = _G.hash("idle");
  __platformer_Hero.anim_jump = _G.hash("jump");
  __platformer_Hero.anim_fall = _G.hash("fall");
  __platformer_Hero.group_geometry = _G.hash("geometry");
  __platformer_Hero.input_left = _G.hash("left");
  __platformer_Hero.input_right = _G.hash("right");
  __platformer_Hero.input_jump = _G.hash("jump");
  __platformer_Hero.input_touch = _G.hash("touch");
  __lua_Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
  
  _hxdefold_ = _hxdefold_ or {}
  __defold_support_Init.init(_hxdefold_);
end

_hx_funcToField = function(f)
  if type(f) == 'function' then 
    return function(self,...) 
      return f(...) 
    end
  else 
    return f
  end
end
_hx_wrap_if_string_field = function(o, fld)
  if _G.type(o) == 'string' then
    if fld == 'length' then
      return _G.string.len(o)
    else
      return String.prototype[fld]
    end
  else
    return o[fld]
  end
end
_hx_static_init();
