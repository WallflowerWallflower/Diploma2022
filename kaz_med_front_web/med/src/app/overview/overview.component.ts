import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {AngularFireAuth} from "@angular/fire/compat/auth";
import {DataService} from "../data.service";
import {AngularFirestore} from "@angular/fire/compat/firestore";
import {HttpService} from "../http.service";

@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrls: ['./overview.component.scss']
})
export class OverviewComponent implements OnInit {
  @Output() submitted = new EventEmitter();
  public userName: string;
  isLoading: boolean = false
  public lastName: string;
  public patients: any = [];
  public clinics: any;
  public uid: any
  public editForm: any = FormGroup;

  constructor(public auth: AngularFireAuth,public ds: DataService,public db: AngularFirestore,public hs: HttpService) {
  }

  ngOnInit(): void {
    let loginEmail = localStorage.getItem('email');
    this.editForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.minLength(3),]),
      lastName: new FormControl('', [Validators.required, Validators.minLength(3),]),
      email:new FormControl('', [Validators.required, Validators.minLength(3),]),
      fees: new FormControl('', [Validators.required]),
      tel: new FormControl('', [Validators.required]),
      address: new FormControl('', [Validators.required]),
      workFrom: new FormControl('', [Validators.required]),
      workTo: new FormControl('', [Validators.required]),
      about: new FormControl('', [Validators.required]),
      // clinic: new FormControl('', [Validators.required]),
      quality: new FormControl('', [Validators.required]),
      // service: new FormControl('', [Validators.required])
    })
  }

  onSubmit(){
    let body =
    {
      doctorName: this.editForm.value.name,
      doctorSurname: this.editForm.value.lastName,
      doctorTelNumber: this.editForm.value.tel,
      doctorEmail: this.editForm.value.email,
      workTimeFrom: this.editForm.value.workFrom,
      workTimeTo: this.editForm.value.workTo,
      about: this.editForm.value.about,
      qualifications: this.editForm.value.quality,
      fees: this.editForm.value.fees,
      address: this.editForm.value.address,
      latitude: "76.911704",
      longitude: "43.246952",

    }
    this.submitted.emit(body)
    this.editForm.reset()
  }
}
