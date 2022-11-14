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

////�_�̓��͂���A�_���o��
//[maxvertexcount(1)]
//void main(
//    point VSOutput input[1] : SV_POSITION,
//	inout PointStream< GSOutput > output
//)
//{
//		GSOutput element;
//		//���_���
//		element.normal = input[0].normal;
//		element.uv = input[0].uv;
//		element.svpos = input[0].svpos;
//		output.Append(element);
//	
//}

////�_�̓��͂���A�O�p�`���o��
//[maxvertexcount(3)]
//void main(
//	point VSOutput input[1] : SV_POSITION,
//	inout TriangleStream< GSOutput > output
//)
//{
//	GSOutput element;
//	//����
//	element.normal = input[0].normal;
//	element.uv = input[0].uv;
//	//1�_��
//	element.svpos = input[0].svpos;
//	output.Append(element);
//	//2�_��
//	element.svpos = input[0].svpos+float4(10.0f,10.0f,0,0);
//	output.Append(element);
//	//3�_��
//	element.svpos = input[0].svpos + float4(10.0f,0,0,0);
//	output.Append(element);
//
//}

//�l�p�`�̒��_��
static const uint vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0),   //����
	float4(-0.5f,+0.5f,0,0),   //����
	float4(+0.5f,-0.5f,0,0),   //�E��
	float4(+0.5f,+0.5f,0,0),   //�E��
};

//���オ0.0 �E����1.1
static const float2 uv_array[vnum] =
{
	float2(0,1),
	float2(0,0),
	float2(1,1),
	float2(1,0)
};
//�_�̓��͂���A�l�p�`���o��
[maxvertexcount(vnum)]
void main(
	point VSOutput input[1] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element;
	//4�_���܂킷
	for (uint i = 0; i < vnum; i++) {
		//���[���h���W�x�[�X�ŁA���炷
		//element.svpos = input[0].pos + offset_array[i];
		// ���S����̃I�t�Z�b�g���r���{�[�h��](���f�����W)
		float4 offset = mul(matBillboard, offset_array[i]);
		//�I�t�Z�b�g�����炷(���[���h���W)
		element.svpos = input[0].pos + offset;
		//�r���[�A�ˉe�ϊ�
		element.svpos = mul(mat, element.svpos);
		//element.uv = float2(0.5f, 0.5f);
		element.uv = uv_array[i];
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
