import { Injectable } from '@angular/core';
import {AngularFirestore} from "@angular/fire/compat/firestore";
import {BehaviorSubject, Observable, Subject} from "rxjs";


@Injectable({
  providedIn: 'root'
})
export class DataService {
  doctors: Observable<any[]>;
  clinics: Observable<any[]>;
  constructor(public db: AngularFirestore) {
    this.doctors = this.db.collection('doctors').valueChanges()
    this.clinics = this.db.collection('clinics').valueChanges()
  }
  public dataSource = new BehaviorSubject({});
  public dataSource2 = new BehaviorSubject('nodata');
  sendDoctor(selectedDoctor:any){
    this.dataSource.next(selectedDoctor)
  }
  getDoctor():Observable<any>{
    return this.dataSource.asObservable();
  }
  getRole(coll:string, uid:string){
    return this.db.collection(coll)
      .doc(uid)
      .get()
  }
  detUserData(coll:string, uid:string){
    return this.db.collection(coll)
      .doc(uid)
      .get()
  }
  setPatientsList(patients:any){
    this.dataSource2.next(patients)
  }
  getPatientsList():Observable<any>{
    return this.dataSource2.asObservable();
  }


}
