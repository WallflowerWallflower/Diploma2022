import {Component, OnInit} from '@angular/core';
import {Router} from "@angular/router";
import {TranslateService} from '@ngx-translate/core';
import {AuthService} from "../auth.service";
import {HttpService} from "../http.service";

@Component({
  selector: 'app-head',
  templateUrl: './head.component.html',
  styleUrls: ['./head.component.scss']
})
export class HeadComponent implements OnInit {
  isLogged: boolean = true
  public currentUser: any

  constructor(private route: Router, public translateService: TranslateService, public hs: HttpService) {
    translateService.addLangs(['kz', 'en', 'rus']);
    translateService.setDefaultLang('kz');
  }

  ngOnInit(): void {
    if (this.route.url === '/') {
      this.route.navigate(['about'])
    }
    localStorage.hasOwnProperty('token') ? this.isLogged : !this.isLogged;
    this.getCurrentUser()

  }

  switchLang(lang: string) {
    this.translateService.use(lang);
  }

  logout() {
    localStorage.removeItem('token')
    this.route.navigate(['login_page'])
  }

  getCurrentUser() {
    // @ts-ignore
    let email: any = JSON.parse(localStorage.getItem('email'))
    if(email){
      this.hs.getAllUsers().subscribe((users) => {
        users.forEach((user: any) => {
          if (user.email === email) {
            this.currentUser = user;
          }
        })
      })
    }
  }
}
