//ancho paredes
espesor = 2;
//longo exterior da caixa
longo = 70+2*espesor;
//ancho exterior da caixa
ancho = 40+2*espesor;
//metrica dos furados
metrica = 3;
//altura dos piares para os parafusos
alturaPiar= 18;
//radio dos furados para interruptores
radioInterruptor=3;

//tapa();
//caixa();

//tapa
module tapa(){
difference(){
hull(){
    cylinder(h=3,r=metrica,$fn=30);
    translate([0,ancho,0]) cylinder(h=3,r=metrica,$fn=30);
    translate([longo,0,0]) cylinder(h=3,r=metrica,$fn=30);
    translate([longo,ancho,0]) cylinder(h=3,r=metrica,$fn=30);
    }
    //furados pasantes
    translate([metrica,metrica,0]) cylinder(h=alturaPiar,r=metrica/2,$fn=30);
    translate([metrica,ancho - metrica,0]) cylinder(h=alturaPiar,r=metrica/2,$fn=30);
    translate([longo - metrica,metrica,0]) cylinder(h=alturaPiar,r=metrica/2,$fn=30);
    translate([longo - metrica,ancho - metrica,0]) cylinder(h=alturaPiar,r=metrica/2,$fn=30);
    //rebaixes cabeza parafusos
    translate([metrica,metrica,1]) cylinder(h=alturaPiar,r=metrica,$fn=30);
    translate([metrica,ancho - metrica,1]) cylinder(h=alturaPiar,r=metrica,$fn=30);
    translate([longo - metrica,metrica,1]) cylinder(h=alturaPiar,r=metrica,$fn=30);
    translate([longo - metrica,ancho - metrica,1]) cylinder(h=alturaPiar,r=metrica,$fn=30);
    //furados interruptores
    translate([14,10,0]) cylinder(r=radioInterruptor,h=10,$fn=20);
    translate([14,22,0]) cylinder(r=radioInterruptor,h=10,$fn=20);
    translate([14,34,0]) cylinder(r=radioInterruptor,h=10,$fn=20);
    //furado LED
    translate([60,ancho/2,0]) cylinder(r=2.5,h=10,$fn=20);
}
}

//caixa
module caixa(){
difference(){
hull(){
    piar();
translate([0,ancho,0]) piar();
translate([longo,0,0]) piar();
translate([longo,ancho,0]) piar();
    }
    hull(){
    translate([metrica,metrica,espesor]) piar();
translate([metrica,ancho - metrica/2,espesor]) piar();
translate([longo - metrica,metrica,espesor]) piar();
translate([longo - metrica,ancho - metrica,espesor]) piar();
    }
}
    translate([metrica,metrica,0]) piar();
translate([metrica,ancho - metrica,0]) piar();
translate([longo - metrica,metrica,0]) piar();
translate([longo - metrica,ancho - metrica,0]) piar();
}
    


//rebaixe parafusos
module rebaixe(){
    union(){
    cylinder(r=metrica/2,h=2*espesor,$fn=30);
    translate([0,0,espesor]) cylinder(r=metrica,h=espesor,$fn=30);
    }
}
//base
module base(){
difference(){
cube([longo, ancho, espesor*2]);
//piares placa
translate([ 10,ancho/2,0]) cylinder(r=metrica/2,h=3*espesor,$fn=30);
translate([ longo-10,ancho/2,0]) cylinder(r=metrica/2,h=3*espesor,$fn=30);
}
//piares
translate([metrica,metrica,0]) piar();
translate([metrica,ancho - metrica/2,0]) piar();
translate([longo - metrica,metrica,0]) piar();
translate([longo - metrica,ancho - metrica,0]) piar();
}


module piar(){
difference(){
cylinder(h=alturaPiar,r=metrica,$fn=30);
cylinder(h=alturaPiar,r=metrica/2,$fn=30);
}
}