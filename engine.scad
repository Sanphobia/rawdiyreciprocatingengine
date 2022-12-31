//rotation timing
strokes= 4;
angletillcombust= (strokes/2)*180;

//bore displacement
displacement=20;
bore = 60;
//cylinder
chamber_height= 80;
chamber_walls=20;
chamber_diameter= bore+chamber_walls;
chamber_center= (bore+chamber_walls)/2;
//pistons
piston_head= 20;
piston_oscillation= chamber_height-piston_head;
//rods
rod_thickness= bore/4;
translate([20,100,0]){
//chamber
difference(){
translate([chamber_center,0,chamber_center]){
rotate([-90,0,0]){
cylinder(chamber_height, d=chamber_diameter);
}
}
//bore cutout
translate([chamber_center,0,chamber_center]){
rotate([-90,0,0]){
cylinder(chamber_height, d=bore);
}
}
//cross-section chamber
    translate([0,0,chamber_center]){
        cube([chamber_diameter,chamber_height,chamber_diameter/2]);
        }
}

//pistonhead
translate([chamber_center,piston_oscillation/2*sin(-360*$t)+chamber_height/2-piston_head/2,chamber_center]){
rotate([-90,0,0]){
cylinder(piston_head,d=bore);
}
}
//rod
//rotate([0,180,180]){
//rotate([0,0,-20*sin(-180*$t)]){
//12.5*sin($t*-360)+
translate([bore/4*cos($t*-360)+chamber_center,piston_oscillation/2*sin(-360*$t),chamber_center]){

    rotate([0,0,0]){
    rotate([0,0,bore/2*cos(-360*$t)]){
cube([rod_thickness,piston_oscillation,rod_thickness],center=true);
//}
}
}
}
translate([chamber_center,-piston_oscillation/2,chamber_center-rod_thickness]){
rotate([0,0,-360*$t]){
cube([piston_oscillation,rod_thickness,rod_thickness],center=true);
}
}
//curly for whole engine
}