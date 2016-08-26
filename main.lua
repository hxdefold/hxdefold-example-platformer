-- Generated by Haxe 3.3.0 (git build development @ e13c7a3)
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
Int = (function() _hxClasses.Int = _hx_o({__fields__={__name__=true},__name__={"Int"}}); return _hxClasses.Int end)();
Dynamic = (function() 
_hxClasses.Dynamic = _hx_o({__fields__={__name__=true},__name__={"Dynamic"}}); return _hxClasses.Dynamic end)();
Float = (function() 
_hxClasses.Float = _hx_e(); return _hxClasses.Float end)();
Float.__name__ = {"Float"}
Bool = (function() 
_hxClasses.Bool = _hx_e(); return _hxClasses.Bool end)();
Bool.__ename__ = {"Bool"}
Class = (function() 
_hxClasses.Class = _hx_o({__fields__={__name__=true},__name__={"Class"}}); return _hxClasses.Class end)();
Enum = _hx_e();

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

local _hx_exports = _hx_exports or {}
_hx_exports["platformer"] = _hx_exports["platformer"] or _hx_e()
local Array = _hx_e()
local Math = _hx_e()
local String = _hx_e()
local Std = _hx_e()
local defold = {}
defold.GoMessages = _hx_e()
defold.PhysicsMessages = _hx_e()
defold.RenderMessages = _hx_e()
defold.SpriteMessages = _hx_e()
defold.support = {}
defold.support.Script = _hx_e()
defold.types = {}
defold.types._Message = {}
defold.types._Message.Message_Impl_ = _hx_e()
local haxe = {}
haxe.io = {}
haxe.io.Eof = _hx_e()
local lua = {}
lua.Boot = _hx_e()
local platformer = {}
platformer.Hero = _hx_e()
platformer.Main = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self


Array.new = {}

Array.prototype = _hx_a(
  'join', function(self,sep) 
    local tbl = ({});
    
    local _gthis = self;
    local cur_length = 0;
    local tmp = _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return (cur_length) < (_gthis.length) end;
    end,next=function() 
      cur_length = (cur_length) + (1);
      do return _gthis[(cur_length) - (1)] end;
    end});
    while (tmp:hasNext()) do 
      _G.table.insert(tbl,Std.string(tmp:next()));
    
    end;
    do return _G.table.concat(tbl,sep) end
  end,
  'push', function(self,x) 
    self[(function() 
    local _hx_obj = self;
    local _hx_fld = 'length';
    local _ = _hx_obj[_hx_fld];
    _hx_obj[_hx_fld] = _hx_obj[_hx_fld]  + 1;
     return _;
     end)()] = x;
    do return self.length end
  end,
  'iterator', function(self) 
    local _gthis = self;
    local cur_length = 0;
    do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return (cur_length) < (_gthis.length) end;
    end,next=function() 
      cur_length = (cur_length) + (1);
      do return _gthis[(cur_length) - (1)] end;
    end}) end
  end
)

Math.new = {}
Math.isNaN = function(f) 
  do return (f) ~= (f) end;
end


String.new = {}
String.__index = function(s,k) 
  if ((k) == ("length")) then 
    do return #s end;
  else
    
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if ((o.__fields__) ~= (nil)) then 
      _hx_1 = (o.__fields__[field]) ~= (nil); else _hx_1 = (o[field]) ~= (nil); end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if ((String.__oldindex) ~= (nil)) then 
        do return String.__oldindex[k] end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end

String.prototype = _hx_a(
  'toString', function(self) 
    do return self end
  end
)

Std.new = {}
Std.string = function(s) 
  do return lua.Boot.__string_rec(s) end;
end


defold.GoMessages.new = {}


defold.PhysicsMessages.new = {}


defold.RenderMessages.new = {}


defold.SpriteMessages.new = {}


defold.support.Script.new = function() 
  local self = _hx_new(defold.support.Script.prototype)
  defold.support.Script.super(self)
  return self
end

defold.support.Script.super = function(self) 
end

defold.support.Script.prototype = _hx_a(
  'init', function(self,_self) 
  end,
  'final', function(self,_self) 
  end,
  'update', function(self,_self,dt) 
  end,
  'on_message', function(self,_self,message_id,message,sender) 
  end,
  'on_input', function(self,_self,action_id,action) 
    do return false end
  end,
  'on_reload', function(self,_self) 
  end
)

defold.types._Message.Message_Impl_.new = {}
defold.types._Message.Message_Impl_._new = function(s) 
  do return _G.hash(s) end;
end


haxe.io.Eof.new = {}

haxe.io.Eof.prototype = _hx_a(
  'toString', function(self) 
    do return "Eof" end
  end
)

lua.Boot.new = {}
lua.Boot.isArray = function(o) 
  if ((_G.type(o)) == ("table")) then 
    
    if (((o.__enum__) == (nil)) and ((_G.getmetatable(o)) ~= (nil))) then 
      do return (_G.getmetatable(o).__index) == (Array.prototype) end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
lua.Boot.printEnum = function(o,s) 
  if ((o.length) == (2)) then 
    do return o[0] end;
  else
    
    local str = Std.string(o[0]) .. "(";
    s = s .. "\t";
    
    local _g1 = 2;
    local _g = o.length;
    while ((_g1) < (_g)) do 
      
      _g1 = (_g1) + (1);
      local i = (_g1) - (1);
      if ((i) ~= (2)) then 
        str = str .. ("," .. lua.Boot.__string_rec(o[i],s));
      else
        str = str .. lua.Boot.__string_rec(o[i],s);
      end;
    
    end;
    do return str .. ")" end;
  end;
end
lua.Boot.printClassRec = function(c,result,s) 
  if ((result) == (nil)) then 
    result = "";
  end;
  local f = lua.Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
lua.Boot.__string_rec = function(o,s) 
  if ((s) == (nil)) then 
    s = "";
  end;
  local _g = type(o);
  local tmp = _g;
  if (tmp) == "boolean" then 
    do return tostring(o) end;
  elseif (tmp) == "function" then 
    do return "<function>" end;
  elseif (tmp) == "nil" then 
    do return "null" end;
  elseif (tmp) == "number" then 
    if ((o) == (_G.math.huge)) then 
      do return "Infinity" end;
    else
      if ((o) == (-_G.math.huge)) then 
        do return "-Infinity" end;
      else
        if ((o) ~= (o)) then 
          do return "NaN" end;
        else
          do return tostring(o) end;
        end;
      end;
    end;
  elseif (tmp) == "string" then 
    do return o end;
  elseif (tmp) == "table" then 
    if ((o.__enum__) ~= (nil)) then 
      do return lua.Boot.printEnum(o,s) end;
    else
      if (((o.toString) ~= (nil)) and (not lua.Boot.isArray(o))) then 
        do return o:toString() end;
      else
        if (lua.Boot.isArray(o)) then 
          
          local o2 = o;
          if ((s.length) > (5)) then 
            do return "[...]" end;
          else
            
            local _g1 = _hx_tab_array({ }, 0);
            
            local _g11 = 0;
            while ((_g11) < (o2.length)) do 
              
              local i = o2[_g11];
              _g11 = (_g11) + (1);
              _g1:push(lua.Boot.__string_rec(i,s .. 1));
            
            end;
            do return "[" .. _g1:join(",") .. "]" end;
          end;
        else
          if ((o.__class__) ~= (nil)) then 
            do return "{" .. lua.Boot.printClassRec(o,"",s .. "\t") .. "}" end;
          else
            
            local fields = lua.Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer,"{ ");
            
            local tmp1 = fields;
            while (tmp1:hasNext()) do 
              
              local f = tmp1:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer,", ");
              end;
              _G.table.insert(buffer,"" .. Std.string(f) .. " : " .. Std.string(o[f]));
            
            end;
            _G.table.insert(buffer," }");
            do return _G.table.concat(buffer,"") end;
          end;
        end;
      end;
    end;
  elseif (tmp) == "thread" then 
    do return "<thread>" end;
  elseif (tmp) == "userdata" then 
    do return "<userdata>" end;
  else
    _G.error("Unknown Lua type",0);
  end;
end
lua.Boot.fieldIterator = function(o) 
  local tbl = (function() 
    local _hx_1
    if ((o.__fields__) ~= (nil)) then 
    _hx_1 = o.__fields__; else _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while ((lua.Boot.hiddenFields[val]) ~= (nil)) do 
      val = cur(tbl1,val);
    
    end;
    do return val end;
  end;
  local cur_val = next_valid(tbl,cur(tbl,nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function() 
    local ret = cur_val;
    cur_val = next_valid(tbl,cur(tbl,cur_val));
    do return ret end;
  end,hasNext=function() 
    do return (cur_val) ~= (nil) end;
  end}) end;
end


platformer.Hero.new = function() 
  local self = _hx_new(platformer.Hero.prototype)
  platformer.Hero.super(self)
  return self
end

platformer.Hero.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["platformer"]["Hero"] = platformer.Hero

platformer.Hero.prototype = _hx_a(
  'init', function(self,_self) 
    _G.msg.post(".",defold.GoMessages.AcquireInputFocus);
    _self.velocity = _G.vmath.vector3(0,0,0);
    _self.correction = _G.vmath.vector3();
    _self.ground_contact = false;
    _self.move_input = 0;
    _self.direction = 1;
    _self.anim = nil;
    _self.touch_jump_timer = 0;
  end,
  'update', function(self,_self,dt) 
    local speed_diff = ((_self.move_input) * (platformer.Hero.max_speed)) - (_self.velocity.x);
    local acceleration = _G.vmath.vector3(0,platformer.Hero.gravity,0);
    if ((speed_diff) ~= (0)) then 
      
      if ((speed_diff) < (0)) then 
        acceleration.x = -platformer.Hero.move_acceleration;
      else
        acceleration.x = platformer.Hero.move_acceleration;
      end;
      if (not _self.ground_contact) then 
        acceleration.x = (platformer.Hero.air_acceleration_factor) * (acceleration.x);
      end;
    end;
    local dv = (acceleration) * (dt);
    if ((_G.math.abs(dv.x)) > (_G.math.abs(speed_diff))) then 
      dv.x = speed_diff;
    end;
    local v0 = _self.velocity;
    _self.velocity = (_self.velocity) + (dv);
    local dp = (((v0) + (_self.velocity)) * (dt)) * (0.5);
    _G.go.set_position((_G.go.get_position()) + (dp));
    if ((_self.touch_jump_timer) > (0)) then 
      _self.touch_jump_timer = (_self.touch_jump_timer) - (dt);
    end;
    self:update_animations(_self);
    _self.correction = _G.vmath.vector3();
    _self.move_input = 0;
    _self.ground_contact = false;
  end,
  'update_animations', function(self,_self) 
    _G.sprite.set_hflip("#sprite",(_self.direction) < (0));
    if (_self.ground_contact) then 
      
      if ((_self.velocity.x) == (0)) then 
        self:play_animation(_self,platformer.Hero.anim_idle);
      else
        self:play_animation(_self,platformer.Hero.anim_run);
      end;
    else
      if ((_self.velocity.y) > (0)) then 
        self:play_animation(_self,platformer.Hero.anim_jump);
      else
        self:play_animation(_self,platformer.Hero.anim_fall);
      end;
    end;
  end,
  'play_animation', function(self,_self,anim) 
    if ((_self.anim) ~= (anim)) then 
      
      _G.msg.post("#sprite",defold.SpriteMessages.PlayAnimation,_hx_o({__fields__={id=true},id=anim}));
      _self.anim = anim;
    end;
  end,
  'handle_geometry_contact', function(self,_self,normal,distance) 
    local proj = _G.vmath.dot(_self.correction,normal);
    local comp = (normal) * ((distance) - (proj));
    _self.correction = (_self.correction) + (comp);
    _G.go.set_position((_G.go.get_position()) + (comp));
    if ((normal.y) > (0.7)) then 
      _self.ground_contact = true;
    end;
    proj = _G.vmath.dot(_self.velocity,normal);
    if ((proj) < (0)) then 
      _self.velocity = (_self.velocity) - ((normal) * (proj));
    end;
  end,
  'on_message', function(self,_self,message_id,message,_) 
    if ((message_id) == (defold.PhysicsMessages.ContactPointResponse)) then 
      
      if ((message.group) == (platformer.Hero.group_geometry)) then 
        self:handle_geometry_contact(_self,message.normal,message.distance);
      end;
    end;
  end,
  'jump', function(self,_self) 
    if (_self.ground_contact) then 
      
      _self.velocity.y = platformer.Hero.jump_takeoff_speed;
      self:play_animation(_self,platformer.Hero.anim_jump);
    end;
  end,
  'abort_jump', function(self,_self) 
    if ((_self.velocity.y) > (0)) then 
      _self.velocity.y = (_self.velocity.y) * (0.5);
    end;
  end,
  'on_input', function(self,_self,action_id,action) 
    local tmp = action_id;
    if (tmp) == platformer.Hero.input_jump then 
      if (action.pressed) then 
        self:jump(_self);
      else
        if (action.released) then 
          self:abort_jump(_self);
        end;
      end;
    elseif (tmp) == platformer.Hero.input_left then 
      
      _self.move_input = -action.value;
      _self.direction = -1;
    elseif (tmp) == platformer.Hero.input_right then 
      
      _self.move_input = action.value;
      _self.direction = 1;
    elseif (tmp) == platformer.Hero.input_touch then 
      
      local diff = (action.x) - (_G.go.get_position().x);
      if ((diff) > (0)) then 
        _self.direction = 1;
      else
        _self.direction = -1;
      end;
      if ((_G.math.abs(diff)) > (10)) then 
        
        _self.move_input = (diff) / (100);
        local b = _self.move_input;
        local b1 = (function() 
          local _hx_1
          if ((Math.isNaN(-1)) or (Math.isNaN(b))) then 
          _hx_1 = 0/0; else _hx_1 = _G.math.max(-1,b); end
          return _hx_1
        end )();
        _self.move_input = (function() 
          local _hx_2
          if ((Math.isNaN(1)) or (Math.isNaN(b1))) then 
          _hx_2 = 0/0; else _hx_2 = _G.math.min(1,b1); end
          return _hx_2
        end )();
      end;
      if (action.released) then 
        _self.touch_jump_timer = platformer.Hero.touch_jump_timeout;
      else
        if (action.pressed) then 
          
          if ((_self.touch_jump_timer) > (0)) then 
            self:jump(_self);
          end;
        end;
      end;
    end;
    do return false end
  end
)
platformer.Hero.__super__ = defold.support.Script
setmetatable(platformer.Hero.prototype,{__index=defold.support.Script.prototype})

platformer.Main.new = function() 
  local self = _hx_new(platformer.Main.prototype)
  platformer.Main.super(self)
  return self
end

platformer.Main.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["platformer"]["Main"] = platformer.Main

platformer.Main.prototype = _hx_a(
  'init', function(self,_) 
    _G.msg.post("@render:",defold.RenderMessages.ClearColor,_hx_o({__fields__={color=true},color=_G.vmath.vector4(0.37647058823529411,0.58039215686274515,0.72549019607843135,0)}));
  end
)
platformer.Main.__super__ = defold.support.Script
setmetatable(platformer.Main.prototype,{__index=defold.support.Script.prototype})
local _hx_string_mt = _G.getmetatable('');
String.__oldindex = _hx_string_mt.__index;
_hx_string_mt.__index = String.__index;
_hx_string_mt.__add = function(a,b) return Std.string(a)..Std.string(b) end;
_hx_string_mt.__concat = _hx_string_mt.__add
_hx_array_mt.__index = Array.prototype

defold.GoMessages.AcquireInputFocus = _G.hash("acquire_input_focus")
defold.GoMessages.Disable = _G.hash("disable")
defold.GoMessages.Enable = _G.hash("enable")
defold.GoMessages.ReleaseInputFocus = _G.hash("release_input_focus")
defold.GoMessages.RequestTransform = _G.hash("request_transform")
defold.GoMessages.SetParent = _G.hash("set_parent")
defold.GoMessages.TransformResponse = _G.hash("transform_response")
defold.PhysicsMessages.ApplyForce = _G.hash("apply_force")
defold.PhysicsMessages.CollisionResponse = _G.hash("collision_response")
defold.PhysicsMessages.ContactPointResponse = _G.hash("contact_point_response")
defold.PhysicsMessages.RequestVelocity = _G.hash("request_velocity")
defold.PhysicsMessages.RayCastResponse = _G.hash("ray_cast_response")
defold.PhysicsMessages.TriggerResponse = _G.hash("trigger_response")
defold.PhysicsMessages.VelocityResponse = _G.hash("velocity_response")
defold.RenderMessages.ClearColor = _G.hash("clear_color")
defold.RenderMessages.DrawLine = _G.hash("draw_line")
defold.RenderMessages.DrawText = _G.hash("draw_text")
defold.RenderMessages.WindowResized = _G.hash("window_resized")
defold.SpriteMessages.AnimationDone = _G.hash("animation_done")
defold.SpriteMessages.PlayAnimation = _G.hash("play_animation")
lua.Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
platformer.Hero.move_acceleration = 3500
platformer.Hero.air_acceleration_factor = 0.8
platformer.Hero.max_speed = 400
platformer.Hero.gravity = -1100
platformer.Hero.jump_takeoff_speed = 700
platformer.Hero.touch_jump_timeout = 0.2
platformer.Hero.anim_run = _G.hash("run")
platformer.Hero.anim_idle = _G.hash("idle")
platformer.Hero.anim_jump = _G.hash("jump")
platformer.Hero.anim_fall = _G.hash("fall")
platformer.Hero.group_geometry = _G.hash("geometry")
platformer.Hero.input_left = _G.hash("left")
platformer.Hero.input_right = _G.hash("right")
platformer.Hero.input_jump = _G.hash("jump")
platformer.Hero.input_touch = _G.hash("touch")
do

end
return _hx_exports
