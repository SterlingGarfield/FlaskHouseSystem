// 折柱混合图 option 封装（去掉不需要的参数，仅保留核心数据配置，样式仍使用 mixedColors 文件）
function getMixedOption(labels, legendData, datas) {
    var series = [];
    datas.forEach((item, i) => {
        series.push({
            name: legendData[i],
            type: item.type,
            data: item.data,
            itemStyle: {color: mixedColors.gradient[i]}
        });
    });
    return {
        tooltip: {trigger: 'axis', axisPointer: {type: 'cross', crossStyle: {color: mixedColors.axisPointer}}},
        legend: {data: legendData, textStyle: {color: mixedColors.text}},
        grid: {left: '3%', right: '4%', bottom: '3%', containLabel: true},
        xAxis: [{
            type: 'category',
            data: labels,
            axisPointer: {type: 'shadow'},
            axisLabel: {color: mixedColors.axis.label},
            axisLine: {lineStyle: {color: mixedColors.axis.line}},
            splitLine: {show: true, lineStyle: {color: mixedColors.axis.splitLine}}
        }],
        yAxis: [{
            type: 'value',
            name: '数据',
            min: 0,
            interval: 50,
            axisLabel: {formatter: '{value}', color: mixedColors.axis.label},
            axisLine: {lineStyle: {color: mixedColors.axis.line}},
            splitLine: {show: true, lineStyle: {color: mixedColors.axis.splitLine}}
        }],
        series: series
    };
}
