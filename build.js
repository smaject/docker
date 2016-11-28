#!/usr/bin/jjs -fv
var images = ["java" ];
for each(image in images) {
    print("\n\n");
    print("Building ${image}");
    $ENV.PWD = image;
    load("${image}/build.js");
    print("Image ${image} built!");
}
