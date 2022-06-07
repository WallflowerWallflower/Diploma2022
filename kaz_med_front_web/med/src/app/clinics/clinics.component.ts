import { Component, OnInit } from '@angular/core';
import {TranslateService} from "@ngx-translate/core";
import {HttpClient} from "@angular/common/http";
import {HttpService} from "../http.service";


@Component({
  selector: 'app-clinics',
  templateUrl: './clinics.component.html',
  styleUrls: ['./clinics.component.scss']
})
export class ClinicsComponent implements OnInit {
  clinics:any = [];
  isClinicSelected = false;
  selectedClinic: any = {}
  selectedClinicDoctors:any = []

  constructor(public translateService: TranslateService,
              public hs: HttpService,
              public http: HttpClient) {
    translateService.setDefaultLang('kz');
  }
  ngOnInit(): void {
    this.hs.getAllClinics().subscribe(res=>{
      this.clinics = res
      console.log(this.clinics)
    })
  }
  toggleInfo(clinic:any){
    this.isClinicSelected = true
    this.selectedClinic = clinic
  }
  selectFilter(event:any){
    console.log(event.target.value)

    if (event.target.value === 'price-decrease'){
      this.clinics = this.clinics.sort((a:any, b:any)=>{
        return a.fees < b.fees ? -1 : 1;
      })
      return this.clinics
    }
    else if(event.target.value === 'price-increase'){
      this.clinics = this.clinics.sort((a:any, b:any)=>{
        return a.fees < b.fees ? 1 : -1;
      })
      return this.clinics
    }
    else{
      this.clinics = this.clinics.sort((a:any, b:any)=>{
        return a.rating < b.rating ? 1 : -1;
      })
    }
  }

}
