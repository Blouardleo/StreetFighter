//
//  ViewController.m
//  Street Fighter
//
//  Created by Leo Blouard on 27/02/15.
//  Copyright (c) 2015 __Blouard__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// bouton plus et moins de la partie 1
- (IBAction)moins1:(id)sender{
    difficulte -=1; // decremente de 1
    if(difficulte<=1){
        difficulte = 1;
    } // fin de if
    [self Difficulte]; // retourne a la procédure Difficulte
}

- (IBAction)plus1:(id)sender{
    difficulte +=1; // incrementede 1
    if(difficulte>=4){
        difficulte = 4;
    } // fin de if
    [self Difficulte]; // retourne la procédure Difficulte
}

// bouton plu et moins de la partie 2
- (IBAction)moins2:(id)sender{
    Round -=1;
    if(Round<=1){
        Round = 1;
    } // fin de if
    [self Round]; // retourne a la procédure Round
}// fin du bouton moins2


- (IBAction)plus2:(id)sender{
    Round +=1;
    if (Round>=3) {
        Round = 3;
    } // fin de if
    [self Round]; // retourne a la procédure Round
} // fin du bouton plus2


// bouton plus et moins de la partie 3
- (IBAction)moins3:(id)sender{
    
    temps-=1; // decremente le temps de 1
    if(temps<=30){ // si le temps est inférieur ou égale à 30
        temps = 30; // fixe le temps minimal a 30
        _moins3.hidden = YES; // cache le bouton moins3
        _temps.text = [NSString stringWithFormat:@"%i", temps]; // affiche le temps dans le label temps
    }
    else{ // sinon
        _moins3.hidden = NO;
        _plus3.hidden = NO;
        _temps.text = [NSString stringWithFormat:@"%i", temps]; // affiche le temps dans le label temps
    }// fin de if/else
} // fin du bouton moins 3

- (IBAction)plus3:(id)sender{
    
    temps+=1; // incremente le temps de 1
    if(temps>=99){ //si le temps est supérieur ou égale à 99
        temps = 99; //fixe le temps maximal a 99
        _plus3.hidden = YES; // cache le bouton plus3
        _temps.text = [NSString stringWithFormat:@"%i", temps]; // affiche le temps dans le label temps
    }
    else{ // sinon
        _moins3.hidden = NO;
        _plus3.hidden = NO;
        _temps.text = [NSString stringWithFormat:@"%i", temps]; // affiche le temps dans le label temps
    }// fin de if/else
} // fin du bouton plus3


// bouton pause
- (IBAction)pause:(id)sender{
    [timer invalidate]; // supprime le timer
} // fin du bouton pause


// bouton plus et moins de la partie 4
- (IBAction)moins4:(id)sender{
    
}

- (IBAction)plus4:(id)sender{
    
}// fin du bouton plus 4


// procédure qui permet de changer le niveau du jeu dans le menu arcade
- (void)Difficulte{
    switch (difficulte){ // permet de changer le niveau de difficulté du jeu
        case 1:
            _difficulte.text=@"FACILE"; // affiche "Facile" lorsque le dificulte = 1
            _moins1.hidden = YES; // cache le bouton moins1
            _plus1.hidden = NO;
            break;
        case 2:
            _difficulte.text=@"MOYEN"; // affiche "Moyen" lorsque le dificulte = 2
            _moins1.hidden = NO;
            _plus1.hidden = NO;
            break;
        case 3:
            _difficulte.text=@"DIFFICILE"; // affiche "Difficile" lorsque le dificulte = 3
            _moins1.hidden = NO;
            _plus1.hidden = NO;
            break;
        case 4:
            _difficulte.text=@"EXTRÊME"; // affiche "Extreme" lorsque le dificulte = 4
            _moins1.hidden = NO;
            _plus1.hidden = YES; // cache le bouton plus1
            break;
            
    } // fin de switch
} // fin de procédure Dificulte



// procédure Round qui permet de changer le nombre de round dans le menu arcade
- (void)Round{
    switch (Round){ // switch permettant d'indiquer et de sauvegarder le nombre de round
        case 1:
            _round.text = [NSString stringWithFormat:@"%i", Round]; // affiche le temps dans le label round
            _moins2.hidden = YES; // cache le bouton moins2
            _plus2.hidden = NO;
            break;
        case 2:
            _round.text = [NSString stringWithFormat:@"%i", Round]; // affiche le temps dans le label round
            _moins2.hidden = NO;
            _plus2.hidden = NO;
            break;
        case 3:
            _round.text = [NSString stringWithFormat:@"%i", Round]; // affiche le temps dans le label round
            _moins2.hidden = NO;
            _plus2.hidden = YES; // cache le bouton plus2
            break;
    } // fin de switch
}// fin de la procédure Round


// procédure qui permet de decrementer le temps lors du combat
- (void)Temps{
    
    if( temps > 0 ){
        temps--; // decremente le temps de 1
        _time.text = [NSString stringWithFormat:@"%i", temps];
    }
    else{
        [timer invalidate]; // supprime le timer
    } // fin de if/else
} // fin de procédure Temps


// procédure qui permet de faire bouger le personnage
-(void)Deplacement{
    _joueur.center = CGPointMake(_joueur.center.x,_joueur.center.y - Saut);
    if(_joueur.center.y>450){
        _joueur.center = CGPointMake(_joueur.center.x, 450);
    }
    Saut = Saut - 3;
    
    if(_joueur.center.y==450){
        _haut.hidden = NO;
    }
    else{
        _haut.hidden =YES;
    } // fin de if/else
} // fin de procédure


// procédure Timer
- (void)Timer{
    if( sec > 0 ){
        sec--;
    }
    else{
        _attack.hidden = YES;
        _carre.hidden = NO;
        _joueur.image = [UIImage imageNamed:@"Sagat-hdstance.gif"]; // l'image prend l'image de ryu.png
         [TimerHadoken invalidate]; // supprime le timer
    } // fin de il/else
} // fin de procédure


// procédure de coups
- (void)Coups{
    
}// fin de procédure


//procédure Hadoken
- (void)Hadoken{
    _attack.center = CGPointMake(_attack.center.x+4, _attack.center.y);
    _joueur.image = [UIImage imageNamed:@"sagat_low_fireball.gif"]; // l'image prend l'image de mouvement1ryu.png

    
    if(CGRectIntersectsRect(_attack.frame, _ennemi.frame)){ // lorsque l'attaque touche ml'ennemi aors
        _joueur.image = [UIImage imageNamed:@"Sagat-hdstance.gif"];// l'image prend l'image de ryu.png

        sec = 0; // seconde prend la valeur de 0
        [self Timer]; // retourne a la pocédure
        _attack.hidden = YES; // cache l'image attack
        _ennemi.center = CGPointMake(_ennemi.center.x+50,_ennemi.center.y); // l'ennemi boude de 50 en abscisse
        [TimerHadoken invalidate]; // supprime le timer
        _carre.hidden = NO;
    }
} // fin de procédure


// procédure uppercut
- (void)Uppercut{
    _joueur.image = [UIImage imageNamed:@"sagat_tiger_uppercut.gif"];
    _joueur.center = CGPointMake(_joueur.center.x+2, _joueur.center.y);
    [TimerUppercut invalidate];
    [self Deplacement];
    Saut = 60;
} // fin de procdure uppercut


// Procédure de la position du personnage
- (void)PositionEnnemi{
    _ennemi.center = CGPointMake(_ennemi.center.x, _ennemi.center.y); // l'ennemi prend la valeur de la valeur actuelle de l'axe des abscisse t des ordonnées
}

// bouton droit
-(IBAction)Droit:(id)sender{
    if(_joueur.center.x>=930){ // si le perso dépasse 930px
        _joueur.center = CGPointMake(_joueur.center.x, _joueur.center.y); // le joueur prend la valeur de la position actuelle
    }
    else{
        _joueur.center = CGPointMake(_joueur.center.x+70,_joueur.center.y); // le joueur prend d'abcisse + 20

    } // fin de if/else
} // fin de bouton droit


// bouton gauche
-(IBAction)Gauche:(id)sender{
    if(_joueur.center.x<=105){ // si la position du perso est inférieure ou égale a 105
        _joueur.center = CGPointMake(_joueur.center.x, _joueur.center.y); // le joueur prend la valeur de la position actuelle

    }
    else{
        _joueur.center = CGPointMake(_joueur.center.x-15, _joueur.center.y);// le joueur prend d'abcisse -15

    } // fin de if/else
}// fin de bouton gauche


// bouton haut
-(IBAction)Haut:(id)sender{
    [self Deplacement];
    Saut = 58;
}
// fin de bouton


//bouton carre
-(IBAction)carre:(id)sender{
    _carre.hidden =YES;
    sec = 2;
    TimerHadoken = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(Hadoken) userInfo:nil repeats:YES];
    _attack.hidden = NO;
    _joueur.center = CGPointMake(_joueur.center.x, _joueur.center.y);
} // fin de bouton carré


// bouton rond
- (IBAction)rond:(id)sender{
    TimerUppercut = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(Uppercut) userInfo:nil repeats:YES];
}// fin de bouton rond


- (void)viewDidLoad {
    _attack.hidden = YES;
    [self Difficulte]; // retourne la procédure Dificulte
    [self Round]; // retourne la procédure Round
    _time.text = [NSString stringWithFormat:@"%i", temps];
    _plus3.hidden = YES; // cache le bouton plus3
    saut = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(Deplacement) userInfo:nil repeats:YES];
    seconde = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Timer) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
