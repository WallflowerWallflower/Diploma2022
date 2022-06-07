import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {HttpService} from "../http.service";

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {
  public editForm: any = FormGroup;

  constructor(public hs: HttpService) {
  }

  ngOnInit(): void {
    this.editForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.minLength(3),]),
      lastName: new FormControl('', [Validators.required, Validators.minLength(3),]),
      email: new FormControl('', [Validators.required, Validators.minLength(3),]),
      tel: new FormControl('', [Validators.required]),
      address: new FormControl('', [Validators.required]),
    })
  }
  onSubmit(){
    let body = {
      customerName: this.editForm.value.name,
      customerSurname: this.editForm.value.lastName,
      customerTelNumber: this.editForm.value.tel,
      customerEmail: this.editForm.value.email,
      address: this.editForm.value.address
    }
    this.hs.updateUser(body).subscribe(res=>{
      console.log(res)
    })
    this.editForm.reset()
    location.reload()
  }
}
