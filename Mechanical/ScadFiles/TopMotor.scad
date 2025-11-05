use <F130Motor.scad>


motor_mount();

module motor_mount(){
difference(){

cube([24,15,29]);

translate([12,5,30]){
rotate([180,0,0]){
    
F130Motor();
}
}

}
}