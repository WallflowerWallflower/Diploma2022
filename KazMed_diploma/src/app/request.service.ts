import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class RequestService {

  private readonly urlDoctors = 'http://localhost:4000/api/doctors'
  private readonly urlClinics = 'http://localhost:4000/api/clinics'

  constructor(private http: HttpClient) {
  }

  getDoctors(): Observable<any> {
    return this.http.get(this.urlDoctors);
  }

  getClinics(): Observable<any> {
    return this.http.get(this.urlClinics);
  }

  getAllUsers(): Observable<any> {
    return this.http.get('http://localhost:3000/users');
  }

  getAllUsers1(page: string): Observable<any> {
    return this.http.get('http://localhost:3000/users?' + page + '&_sort=name&_order=desc');
  }

  deleteUser(id: any) {
    return this.http.delete('http://localhost:3000/users/' + id);
  }

  createUser(user: any): Observable<any> {
    return this.http.post('http://localhost:3000/users', user);
  }
}
