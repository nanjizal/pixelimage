package pixelimage;
/**
    little endian most desktops and laptops, seems that canvas context is ABGR so this is used to detect conversion
**/
final isLittleEndian = (() -> {
    final a8 = new js.lib.Uint8Array(4);
    final a32 = (new js.lib.Uint32Array(a8.buffer)[0]=0xFFcc0011);
    return !(a8[0]==0xff);
})();