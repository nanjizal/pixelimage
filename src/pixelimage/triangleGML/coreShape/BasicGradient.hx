package pixelimage.triangleGML.coreShape;
import pixelimage.Pixelimage;
import pixelimage.triangleGML.coreShape.GroupShape;

@:structInit
class BasicGradient extends GroupShape {
    public var cornerColors = new Array<Int>();
    public function new(  opacity            = 1.
                        , visibility         = true
                        , cornerColors       = null
                        ){
        super( opacity, visibility );
        if( cornerColors != null ) this.cornerColors = cornerColors;
    }
    public override function setParameter( name: String, value: String ){
        switch( name ){
            case 'cornerColors':
                value = value.split('[')[1].split(']')[0];
                cornerColors = [ for( n in value.split(',') ) Std.parseInt( n )  ]; 
            case _:
                super.setParameter( name, value );
        }
    }
}