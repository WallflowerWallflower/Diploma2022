import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-display-show-component',
  templateUrl: './display-show-component.component.html',
  styleUrls: ['./display-show-component.component.css']
})
export class DisplayShowComponentComponent implements OnInit {

  @Input() fullname: any;

  @Input() class: any;

  @Input() rate: any;

  @Input() about!: string;

  @Input() services: string[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
