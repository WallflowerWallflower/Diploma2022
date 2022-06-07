import {Component, OnInit, Output} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {HttpClient} from "@angular/common/http";
import {HttpService} from "../http.service";
import {TranslateService} from "@ngx-translate/core";


@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.scss']
})
export class AuthComponent implements OnInit {
  loginForm: any = FormGroup;
  public email: string
  public users = [];
  public doctors = []
  public isUser: boolean;
  public isDoctor: boolean;
  isRegister: boolean = true;
  isLoading: boolean = false;

  constructor(private route: Router, public http: HttpClient, public hs: HttpService,public translateService: TranslateService) {
    translateService.addLangs(['kz','en','rus']);
    translateService.setDefaultLang('kz');
  }

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(5)]),
      role: new FormControl('',[Validators.required])
    })
  }

  onSubmit() {
    this.isLoading = true
    this.email = this.loginForm.value.email;
    let password = this.loginForm.value.password;
    let body = {
      username: this.email,
      password: password
    }
    this.hs.login(body).subscribe(
      res=>{
        if (res.status === 200){
          console.log(res)
          let token = res.headers.get('authorization')?.split(',')[0].split(':')[1]
          localStorage.setItem('token', JSON.stringify(token));
          localStorage.setItem('email', JSON.stringify(this.email));
          if (this.loginForm.value.role === 'USER'){
            this.route.navigate(['clinics'])
          }
           else if (this.loginForm.value.role === 'DOCTOR'){
            this.route.navigate(['doctorPage'])
          }
        }
      },
      error => {
        if(error.status){
          alert ('Please Register')
          this.route.navigate(['reg_page'])
        }
      })
    this.isLoading = false

  }
  switchLang(lang:string){
    this.translateService.use(lang);
  }
}
