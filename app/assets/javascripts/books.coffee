# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.draw_graph = -> 
  ctx = document.getElementById("myChart").getContext('2d')
  myChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: ["６日前","５日前","４日前","３日前","２日前","昨日","今日",],
      datasets:[
        {
          label: ["投稿した本の数"],
          data: [gon.six_days_ago, gon.five_days_ago, gon.four_days_ago, gon.three_days_ago, gon.two_days_ago, gon.yesterday, gon.today ],
          borderColor: "rgba(0,0,255,1)"
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: "７日間の投稿数の比較"
      },
      scales:{
        yAxes:[{
          ticks: {
            suggestedMax: 10,
            suggestedMin: 0,
            stepSize: 1,
            }
          }]
        },
      }
  })