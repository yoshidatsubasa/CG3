#include"Particle.hlsli"

//[maxvertexcount(3)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	for (uint i = 0; i < 3; i++)
//	{
//		GSOutput element;
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//	}
//}

////点の入力から、点を出力
//[maxvertexcount(1)]
//void main(
//    point VSOutput input[1] : SV_POSITION,
//	inout PointStream< GSOutput > output
//)
//{
//		GSOutput element;
//		//頂点情報
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//		element.svpos = input[0].svpos;
//		output.Append(element);
//	
//}

////点の入力から、三角形を出力
//[maxvertexcount(3)]
//void main(
//	point VSOutput input[1] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	//共通
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	//1点目
//	element.svpos = input[0].svpos;
//	output.Append(element);
//	//2点目
//	element.svpos = input[0].svpos+float4(10.0f,10.0f,0,0);
//	output.Append(element);
//	//3点目
//	element.svpos = input[0].svpos + float4(10.0f,0,0,0);
//	output.Append(element);
//
//}

//四角形の頂点数
static const uint vnum = 4;

//センターからのオフセット
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0),   //左下
	float4(-0.5f,+0.5f,0,0),   //左上
	float4(+0.5f,-0.5f,0,0),   //右下
	float4(+0.5f,+0.5f,0,0),   //右上
};

//左上が0.0 右下が1.1
static const float2 uv_array[vnum] =
{
	float2(0,1),
	float2(0,0),
	float2(1,1),
	float2(1,0)
};
//点の入力から、四角形を出力
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	//4点分まわす
	for (uint i = 0; i < vnum; i++) {
		//ワールド座標ベースで、ずらす
		//element.svpos = input[0].pos + offset_array[i];
		// 中心からのオフセットをビルボード回転(モデル座標)
		float4 offset = mul(matBillboard, offset_array[i]);
		//オフセット分ずらす(ワールド座標)
		element.svpos = input[0].pos + offset;
		//ビュー、射影変換
		element.svpos = mul(mat, element.svpos);
		//element.uv = float2(0.5f, 0.5f);
		element.uv = uv_array[i];
		output.Append(element);
	}
}


//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	//線分ストリーム
//	inout LineStream<GSOutput>output
//)
//{
//	    //線分の始点
//		GSOutput element;
//		element.svpos = input[0].svpos;
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//		output.Append(element);
//
//		//線分の終点
//		element.svpos = input[1].svpos;
//		element.normal = input[1].normal;
//		element.uv = input[1].uv;
//		output.Append(element);
//}

//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	//線分ストリーム
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	//三角形の頂点1点ずつ扱う
//	for (uint i = 0; i < 3; i++)
//	{
//		//線分の始点
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//
//		//線分の終点
//		if (i == 2)
//		{
//			//+1するとあふれるので、最初に戻る
//			element.svpos = input[0].svpos;
//			element.normal = input[0].normal;
//			element.uv = input[0].uv;
//		}
//		else
//		{
//			element.svpos = input[i+1].svpos;
//			element.normal = input[i+1].normal;
//			element.uv = input[i+1].uv;
//		}
//		//現在のストリップを終了し、次のストリップを開始
//		output.Append(element);
//	}
//}
