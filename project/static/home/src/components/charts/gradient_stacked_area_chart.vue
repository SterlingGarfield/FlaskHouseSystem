<template>
  <div class="line_chart" :id="id">区域图</div>
</template>

<script>
import * as echarts from "@/assets/js/echarts.min.js";

const GRADIENTCOLOR = [
  ['rgba(128, 255, 165,0.3)', 'rgba(1, 191, 236,0)'],
  ['rgba(0, 221, 255,0.3)', 'rgba(77, 119, 255,0)'],
  ['rgba(55, 162, 255,0.3)', 'rgba(116, 21, 219,0)'],
  ['rgba(255, 0, 135,0.3)', 'rgba(135, 0, 157,0)'],
  ['rgba(255, 191, 0,0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(5, 25, 246, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(154, 96, 180, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(255, 0, 0, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(128, 140, 120,0.3)', 'rgba(1, 191, 236,0)'],
  ['rgba(0, 180, 255,0.3)', 'rgba(77, 119, 255,0)'],
  ['rgba(55, 192, 255,0.3)', 'rgba(116, 21, 219,0)'],
  ['rgba(255, 35, 135,0.3)', 'rgba(135, 0, 157,0)'],
  ['rgba(255, 68, 0,0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(5, 25, 87, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(154, 10, 180, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(35, 21, 0, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(128, 255, 165,0.3)', 'rgba(1, 191, 236,0)'],
  ['rgba(0, 221, 255,0.3)', 'rgba(77, 119, 255,0)'],
  ['rgba(55, 162, 255,0.3)', 'rgba(116, 21, 219,0)'],
  ['rgba(214, 0, 135,0.3)', 'rgba(135, 0, 157,0)'],
  ['rgba(222, 0, 45,0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(5, 25, 246, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(154, 96, 180, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(255, 177, 0, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(128, 140, 120,0.3)', 'rgba(1, 191, 236,0)'],
  ['rgba(255, 145, 255,0.3)', 'rgba(77, 119, 255,0)'],
  ['rgba(55, 192, 255,0.3)', 'rgba(116, 21, 219,0)'],
  ['rgba(255, 35, 135,0.3)', 'rgba(135, 0, 157,0)'],
  ['rgba(240, 150, 0,0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(15, 91, 87, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(58, 54, 180, 0.3)', 'rgba(224, 62, 76,0)'],
  ['rgba(53, 121, 0, 0.3)', 'rgba(224, 62, 76,0)'],
]
export default {
  name: "Home",
  components: {},
  props: {
    id: {
      type: String,
      default: "lineChart"
    },
    title: {
      type: String,
      default: "XXX区域图"
    },
    vm: {
      type: Object,
      default: function () {
        return {
          xAxis: "xAxis",
          names: "names",
          values: "values",
        };
      },
    }
  },
  data() {
    return {
      option: {
        color: [
          '#80FFA5',
          '#00DDFF',
          '#37A2FF',
          '#FF0087',
          '#FFBF00',
          '#0519f6',
          '#9A60B4',
          '#ff0000'
        ],
        title: {
          text: "XXX区域图",
          left: "center",
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          type: 'scroll',
          orient: 'horizontal',
          y: 'bottom'
        },
        grid: {
          left: "3%",
          right: "10%",
          bottom: "14%",
          containLabel: true,
        },
        toolbox: {
          feature: {
            saveAsImage: {},
          },
        },
        xAxis: [{
          type: 'category',
          boundaryGap: false,
          data: []
        }],
        yAxis: [{
          type: 'value'
        }],
        series: [
          // {
          // 	name: 'Forest',
          // 	type: 'bar',
          // 	barGap: 0,
          // 	emphasis: {
          // 		focus: 'series'
          // 	},
          // 	data: [320, 332, 301, 334, 390]
          // },
        ]
      }
    };
  },
  created() {

  },
  mounted() {
    let that = this;
    setTimeout(function () {
      that.init_chart();
    }, 2000)
  },
  methods: {
    init_chart() {
      var option = this.option;

      var title = this.title;
      if (title) {
        option.title.text = title;
      }

      var series = this.series;
      option.series = series;

      var xAxis = option.xAxis[0];
      xAxis.data = this.vm.xAxis;

      if (xAxis.data.length > 4) {
        option.axisLabel = {
          interval: 0, //使x轴文字显示全
          formatter: function (params) {
            let newParamsName = '';
            const paramsNameNumber = params.length; // 文字总长度
            const provideNumber = 4; //一行显示几个字
            const rowNumber = Math.ceil(paramsNameNumber / provideNumber);
            if (paramsNameNumber > provideNumber) {
              for (let p = 0; p < rowNumber; p++) {
                const start = p * provideNumber;
                const end = start + provideNumber;
                const tempStr = p === rowNumber - 1 ? params.substring(start, paramsNameNumber) : params.substring(start, end) + '\n';
                newParamsName += tempStr;
              }
            } else {
              newParamsName = params;
            }
            return newParamsName;
          },
        }
      }
      let myChart = echarts.init(document.getElementById(this.id));
      myChart.setOption(option);
    },
  },
  computed: {
    series() {
      var vm = this.vm;
      var list = this.vm.names;
      var values = vm.values;
      var series = [];
      for (let i = 0; i < list.length; i++) {
        let data = []
        for (let j = 0; j < values.length; j++) {
          data.push(values[j][i]);
        }
        let dict_type = {
          name: list[i],
          type: 'line',
          smooth: true,
          stack: 'Total',
          lineStyle: {
            width: 1
          },
          showSymbol: false,
          emphasis: {
            focus: 'series'
          },
          areaStyle: {
            opacity: 0.5
          },
          data: data
        }
        series.push(dict_type);
      }

      return series;
    },
    getValues() {
      return this.vm.values
    }
  },
  watch: {
    list() {
      this.init_chart();
    },
    getValues(newV,oldV) {
      this.init_chart();
    }
  },
};
</script>
