import {CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot} from "@angular/router";
import {Observable} from "rxjs";
import {Router} from "@angular/router";
import {Injectable} from "@angular/core";
import {AngularFireAuth} from "@angular/fire/compat/auth";
@Injectable()
export class AboutGuard implements CanActivate{
  constructor(public router : Router, public auth: AngularFireAuth) {}
  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) : Observable<boolean> | boolean{
    if (localStorage.getItem('token')){
      return true;
    }else{
      alert('Please register or login')
      this.router.navigate(['login_page'])
     return false
    }


  }
}
