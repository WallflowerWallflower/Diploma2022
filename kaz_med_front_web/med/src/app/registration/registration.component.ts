import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {Router} from "@angular/router";
import {HttpService} from "../http.service";
import {HttpClient} from "@angular/common/http";
import {environment} from "../../environments/environment";
import {TranslateService} from "@ngx-translate/core";


@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.scss']
})
export class RegistrationComponent implements OnInit {
  public apiUrl = environment.apiUrl;
  isLoading:boolean = false
  regForm:any = FormGroup;
  constructor(public hs: HttpService, public router: Router,public http: HttpClient,public translateService: TranslateService) {
    translateService.addLangs(['kz','en','rus']);
    translateService.setDefaultLang('kz');
  }
  ngOnInit(): void {

    this.regForm= new FormGroup ( {
      name:new FormControl('',[Validators.required, Validators.minLength(3),]),
      lastName:new FormControl('',[Validators.required, Validators.minLength(3),]),
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(5)]),
      role: new FormControl('',[Validators.required])
    })
  }
  // }
  onSubmit(){
    console.log(this.regForm.value)
    let body:any = {
      customerName: this.regForm.value.name,
      customerSurname: this.regForm.value.lastName,
      customerTelNumber: "",
      email: this.regForm.value.email,
      username: this.regForm.value.name,
      password: this.regForm.value.password,
      address: "",
      roles: [
        this.regForm.value.role
      ]
    }
    if (this.regForm.value.role === 'DOCTOR'){
      this.http.post( `${this.apiUrl}/auth-service/registration/add-doctor?password2`, {
        doctorName: this.regForm.value.name,
        doctorSurname: this.regForm.value.lastName,
        doctorTelNumber: "",
        doctorEmail: this.regForm.value.email,
        password: this.regForm.value.password,
        username: this.regForm.value.name,
        roles: [
          this.regForm.value.role
        ]
      } ).subscribe(res=>{
        console.log(res);
      })
    }
    else if (this.regForm.value.role === 'USER'){

      this.http.post( `${this.apiUrl}/auth-service/registration/add-customer`, {
        customerName: this.regForm.value.name,
        customerSurname: this.regForm.value.lastName,
        customerTelNumber: "",
        email: this.regForm.value.email,
        username: this.regForm.value.name,
        password: this.regForm.value.password,
        address: "",
        roles: [
          this.regForm.value.role
        ]
      } ).subscribe(res=>{
        console.log(res);
      })
    }

    this.regForm.reset()
    this.router.navigate(['login_page'])
  }
  switchLang(lang:string){
    this.translateService.use(lang);
  }
}
