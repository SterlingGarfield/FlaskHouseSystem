// 词云图 option 封装
// data: 数据数组，格式为 [{name: string, value: number}, ...]
function getWordcloudOption(wordData) {
    return {
        tooltip: {
            show: true
        },
        series: [{
            type: 'wordCloud',
            shape: 'circle',
            left: 'center',
            top: 'center',
            width: '90%',
            height: '90%',
            right: null,
            bottom: null,
            sizeRange: [12, 60],
            rotationRange: [-90, 90],
            rotationStep: 45,
            gridSize: 8,
            drawOutOfBound: false,
            textStyle: {
                fontFamily: 'sans-serif',
                fontWeight: 'bold',
                color: function () {
                    return wordcloudColors.gradient[
                        Math.floor(Math.random() * wordcloudColors.gradient.length)
                    ];
                }
            },
            emphasis: {
                focus: 'self',
                textStyle: {
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            data: wordData
        }]
    };
}
