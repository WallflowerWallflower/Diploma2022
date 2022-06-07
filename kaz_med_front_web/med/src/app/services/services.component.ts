import { Component, OnInit } from '@angular/core';
import {HttpService} from "../http.service";

@Component({
  selector: 'app-services',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.scss']
})
export class ServicesComponent implements OnInit {
  public doctors: any
  public allSpecialities:any = []
  constructor(public hs: HttpService) { }

  ngOnInit(): void {
    this.hs.getAllSpecialities().subscribe(res=>{
      this.allSpecialities = res;
    });
  }

}
