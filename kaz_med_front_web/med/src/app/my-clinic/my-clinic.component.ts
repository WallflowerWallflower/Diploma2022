import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";

@Component({
  selector: 'app-my-clinic',
  templateUrl: './my-clinic.component.html',
  styleUrls: ['./my-clinic.component.scss']
})
export class MyClinicComponent implements OnInit {
  public addForm: any = FormGroup;

  constructor() { }

  ngOnInit(): void {
    this.addForm = new FormGroup({
      about: new FormControl('', [Validators.required]),
      admission: new FormControl('',[Validators.required] ),
      services: new FormControl('',[Validators.required] ),
      doctors: new FormControl('',[Validators.required] )
    })
  }
  onSubmit() {
    console.log(this.addForm.value)
  }

}
