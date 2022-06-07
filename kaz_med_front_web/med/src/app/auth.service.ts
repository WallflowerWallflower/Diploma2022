import {Injectable} from '@angular/core';
import {AngularFireAuth} from "@angular/fire/compat/auth";
import {Router} from "@angular/router";



@Injectable({
  providedIn: 'root'
})
export class AuthService {


  constructor(public auth: AngularFireAuth, public router: Router) {
  }
  getAuthStatus(){
    return this.auth.authState
  }
  authLogout(){
    this.auth.signOut();
    console.log('Sign ot')
  }



}

