$fn = 50; 
diameter_head = 95; 
length_head = 60; 
thickness_head = 30; 
length_handle = 180; 
diameter_handle = 25; 

module hammer_head() {
  difference() {
    union() {
      translate([0, 0, thickness_head/2])
        rotate_extrude(convexity = 10)
          circle(d=diameter_head, $fn=fn);
      translate([0, 0, -thickness_head/2])
        rotate_extrude(convexity = 10)
          circle(d=diameter_head, $fn=fn);
      
      for (i = [-thickness_head/2 : thickness_head/2]) {
        translate([0, 0, i])
          rotate_extrude(convexity = 10)
            polygon(points=[[diameter_head/2, 0], [0, length_head/2], [-diameter_head/2, 0], [0, -length_head/2]]);
      }
    }
    
    translate([0, 0, thickness_head/2])
      cylinder(d=diameter_handle, h=thickness_head, $fn=fn);
  }
}

module hammer_handle() {
  difference() {
    union() {
      translate([0, 0, length_handle/2])
        rotate_extrude(convexity = 10)
          circle(d=diameter_handle, $fn=fn);
      translate([0, 0, -length_handle/2])
        rotate_extrude(convexity = 10)
          circle(d=diameter_handle, $fn=fn);
      
      for (i = [-length_handle/2 : length_handle/2]) {
        translate([0, 0, i])
          rotate_extrude(convexity = 10)
            polygon(points=[[diameter_handle/2, 0], [0, diameter_handle/2], [-diameter_handle/2, 0], [0, -diameter_handle/2]]); // ty for helping
      }
    }
    
    translate([0, 0, -length_handle/2])
      cylinder(d=diameter_head, h=length_handle, $fn=fn);
  }
}

module hammer() {
  union() {
  hammer_head();
  hammer_handle();
}

hammer();
