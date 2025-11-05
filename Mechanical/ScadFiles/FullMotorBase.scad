use <XY-MosMount.scad>;
use <KY-040Encoder.scad>;
use <TopMotor.scad>
motorbase();

module motorbase(){
    union(){
    translate([0,-10,0]){
    XYMosMount();
    }
    rotate([0,0,180]){
    Ky040Mount();
    }
    rotate([0,0,180]){
    translate([0,-15,0]){
    motor_mount();
    }
}
}
    
    
    
    
    
}