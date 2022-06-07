import { Injectable } from '@angular/core';
import {environment} from "../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Router} from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class HttpService {
  public apiUrl = environment.apiUrl;
  constructor(public http: HttpClient,private route: Router) {}

  login(body:any){    console.log(body);
    return this.http.request('POST',`${this.apiUrl}/auth-service/auth`,{
      body:body,
      observe: 'response'
    })
  }

  getAllUser():Observable<any>{
   let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.get(`${this.apiUrl}/client-service/customer/private/all`, {
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getAllClinics():Observable<any>{
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.get(`${this.apiUrl}/med-service/medCenter/public/all`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getAllDoctors():Observable<any>{
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.get(`${this.apiUrl}/med-service/doctor/public/all`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getAllUsers():Observable<any>{
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.get(`${this.apiUrl}/client-service/customer/private/all`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getDoctorByEmail(email:string):Observable<any>{
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.get(`${this.apiUrl}/auth-service/doctor/private/find/${email}`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  updateDoctor(body:object):Observable<any>{
    console.log(body)
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.request('PUT',`${this.apiUrl}/auth-service/doctor/private/update/${mail}`,{
      body:body,
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  createAppointment(body:object, id:string){
    console.log(body)
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.request('POST',`${this.apiUrl}/appointment-service/appointment/public/create-appointment/${id}/${mail}`,{
      body:body,
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getOwnAppointments():Observable<any>{
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.request('GET',`${this.apiUrl}/appointment-service/appointment/private/customer/${mail}`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getDoctorAppointments():Observable<any>{
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.request('GET',`${this.apiUrl}/appointment-service/appointment/private/doctor/${mail}`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  setFeedback(docId:any, userId:any, body:any):Observable<any>{
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}')
    return this.http.request('POST',`${this.apiUrl}/review-service/review/doctor/private/create-review/${docId}/${mail}`,{
      body:body,
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  getDoctorReview(id:any):Observable<any>{
    let token = JSON.parse(localStorage.getItem('token') || '{}');
    return this.http.request('GET',`${this.apiUrl}/review-service/review/doctor/private/all/${id}`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }
  updateUser(body:any){
    let mail = JSON.parse(localStorage.getItem('email') || '{}')
    let token = JSON.parse(localStorage.getItem('token') || '{}');
    return this.http.request('PUT',`${this.apiUrl}/client-service/customer/private/update/${mail}`,{
      body:body,
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }

  getAllSpecialities(){
    let token = JSON.parse(localStorage.getItem('token') || '{}');
    return this.http.request('GET',`${this.apiUrl}/med-service/specialty/all`,{
      headers:{
        "Authorization": `Bearer${token}`
      }
    })
  }

}
