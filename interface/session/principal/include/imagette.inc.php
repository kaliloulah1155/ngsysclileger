<?php

if (!defined("IMAGETTE"))
{
	define("IMAGETTE",1);
	define("TAILLE_IMAGETTE", 1000);
	
	// pour une meilleure qualite (0->100).
	define("QUALITE_IMAGETTE", 100);



//print_r(gd_info(void));

	function resize($file,$fileName) //voici la fonction qui redimensionne les images
	{
	    // getimagesize() retourne un tableau de 4 éléments.
	    // L'index 0 contient la largeur.
	    // L'index 1 contient la longueur. 
	    // L'index 2 contient le type de l'image : 2 = JPG, 3 = PNG.

	    $size = getimagesize("$file");
	    
	    //détermine la taille de la miniature.
	    if($size[0] > $size[1])
	    {
	    	$dest_width = TAILLE_IMAGETTE;
	    	$dest_eight = $size[1] * TAILLE_IMAGETTE / $size[0];
	    }
	    else
	    {
	    	$dest_eight = TAILLE_IMAGETTE;
	    	$dest_width = $size[0] * TAILLE_IMAGETTE / $size[1];
	    }
	
	    switch($size[2])
		{
			case 2 : if (imagetypes() & IMG_JPG)
					$src_img = imagecreatefromjpeg("$file");  // l'image est au format jpeg
				break;
	
			case 3 : if (imagetypes() & IMG_PNG)
					$src_img = imagecreatefrompng("$file");  // l'image est au format png
				break;
		}
	
	    $dst_img = imagecreatetruecolor($dest_width,$dest_eight);
	
		// la fonction qui redimensionne les photos
	    imagecopyresized($dst_img, $src_img, 0, 0, 0, 0, $dest_width, $dest_eight, $size[0], $size[1]);
	    
	    // pour une meilleure qualite augmenter le 3e parametre de imagejpeg (0->100).
	    imagejpeg($dst_img, $fileName, QUALITE_IMAGETTE);
	    imagedestroy($src_img);
	    imagedestroy($dst_img);    
	}
}
	
?>