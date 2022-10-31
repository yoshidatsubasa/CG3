#include"BasicShaderHeader.hlsli"

[maxvertexcount(3)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
}

//[maxvertexcount(2)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	//�����X�g���[��
//	inout LineStream<GSOutput>output
//)
//{
//	    //�����̎n�_
//		GSOutput element;
//		element.svpos = input[0].svpos;
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//		output.Append(element);
//
//		//�����̏I�_
//		element.svpos = input[1].svpos;
//		element.normal = input[1].normal;
//		element.uv = input[1].uv;
//		output.Append(element);
//}

//[maxvertexcount(6)]
//void main(
//	triangle VSOutput input[3] : SV_POSITION,
//	//�����X�g���[��
//	inout LineStream<GSOutput>output
//)
//{
//	GSOutput element;
//
//	//�O�p�`�̒��_1�_������
//	for (uint i = 0; i < 3; i++)
//	{
//		//�����̎n�_
//		element.svpos = input[i].svpos;
//		element.normal = input[i].normal;
//		element.uv = input[i].uv;
//		output.Append(element);
//
//		//�����̏I�_
//		if (i == 2)
//		{
//			//+1����Ƃ��ӂ��̂ŁA�ŏ��ɖ߂�
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
//		//���݂̃X�g���b�v���I�����A���̃X�g���b�v���J�n
//		output.Append(element);
//	}
//}
